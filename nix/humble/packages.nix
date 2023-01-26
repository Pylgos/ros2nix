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
      # The default implementation must be available to all dependent packages
      # at build time.
      propagatedBuildInputs = [
        final.rmw_fastrtps_cpp
      ] ++ propagatedBuildInputs;
    });

    buildRosPackage = l.buildRosPackageFor final;

    minimalEnv = final.buildRosPackage {
      pname = "minimal";
      version = "0.0.0";

      buildDepend = [
        "examples_rclcpp_minimal_subscriber"
        "examples_rclcpp_minimal_publisher"
        "ros2cli"
        "ros2run"
      ];
    };
  };

  prev = sysPkgs // rosPkgs;
  final = prev // (overlay final prev);
in
final
