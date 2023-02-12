{ inputs
, cell
}:
let
  inherit (inputs) self nixpkgs;
  l = nixpkgs.lib // inputs.cells.common.lib // builtins;

  sysPkgs = inputs.cells.system-packages.lib.instantiateSystemPackageSet {
    inherit nixpkgs;
    py3version = "310";
    py2version = "27";
  };
  
  rosPkgs = l.loadRosDistroFromJson final "humble" "${self}/packages.json";

  overlay = final: prev: {
    rmw_implementation = prev.rmw_implementation.overrideAttrs ({ propagatedBuildInputs ? [ ]
                                                                 , ...
                                                                 }: {
      propagatedBuildInputs = [
        final.rmw_fastrtps_cpp
      ] ++ propagatedBuildInputs;
    });

    qt_gui_cpp = prev.qt_gui_cpp.overrideAttrs ({ postPatch ? "", ... }: {
      postPatch = postPatch + ''
        substituteInPlace src/CMakeLists.txt --replace 'NOT qt_gui_cpp_BINDINGS' 'FALSE'
        substituteInPlace CMakeLists.txt --replace 'NOT qt_gui_cpp_BINDINGS' 'FALSE'
      '';
    });

    desktop = prev.desktop.overrideAttrs (old: {
      ROS2NIX_SETUP_VERBOSE=true;
    });

    buildRosPackage = l.buildRosPackageFor final;

    mkRosWorkspace = l.mkRosWorkspaceFor final;

    testWorkspace = final.mkRosWorkspace {
      pkgs = [
        "examples_rclcpp_minimal_subscriber"
        "examples_rclcpp_minimal_publisher"
        "ros2cli"
        "ros2run"
        # "rqt"
        # "rqt_graph"
        # "rviz2"
        # "desktop"
      ];
    };
  };

  prev = sysPkgs // rosPkgs;
  final = prev // (overlay final prev);
in
final
