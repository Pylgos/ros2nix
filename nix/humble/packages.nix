{ inputs
, cell
}:
let
  inherit (inputs) self nixpkgs;
  l = nixpkgs.lib // inputs.cells.common.lib // builtins;

  systemPackages = inputs.cells.system-packages.lib.instantiateSystemPackageSet {
    inherit nixpkgs;
    py3version = "310";
    py2version = "27";
  };
  
  rosPkgs = l.loadRosDistroFromJson final "humble" "${self}/packages.json";

  overlay = final: prev: {
    buildRosPackage = l.buildRosPackageFor final;

    mkRosWorkspace = l.mkRosWorkspaceFor final;
    
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

    plotjuggler = prev.plotjuggler.overrideAttrs ({ postFixup ? "", ...}: {
      postFixup = postFixup + ''
        echo 'source;share/plotjuggler/local_setup.dsv' >> "$out"/share/plotjuggler/package.dsv
      '';
    });

    plotjuggler_ros = prev.plotjuggler_ros.overrideAttrs ({ postFixup ? "", ...}: {
      postFixup = postFixup + ''
        echo 'source;share/plotjuggler_ros/local_setup.dsv' >> "$out"/share/plotjuggler_ros/package.dsv
      '';
    });

    rosbags = nixpkgs.python310Packages.buildPythonPackage rec {
      pname = "rosbags";
      version = "0.9.14";
      format = "pyproject";
      src = nixpkgs.python310Packages.fetchPypi {
        inherit pname version;
        hash = "sha256-3H+6pB1hsoCOfleYtJGFUinxF8uasOrujIuz/6mInQs=";
      };
      propagatedBuildInputs = with nixpkgs.python310Packages; [
        setuptools numpy lz4 zstandard ruamel-yaml
      ];
    };

    testWorkspace = final.mkRosWorkspace {
      pkgs = with final; [
        examples_rclcpp_minimal_subscriber
        examples_rclcpp_minimal_publisher
        "rosbags"
        "desktop"
      ];

      shellHook = ''
        works() {
          echo works
        }
      '';
    };

    testws = final.mkRosWorkspace {
      pkgs = with final; [
        ros2cli
        ros2run
        plotjuggler_ros
      ];

      shellHook = ''
        works() {
          echo works
        }
      '';
    };
  };

  prev = { inherit systemPackages; } // rosPkgs;
  final = prev // (overlay final prev);
in
final
