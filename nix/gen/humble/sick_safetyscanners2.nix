{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  rclcpp_lifecycle,
  sensor_msgs,
  sick_safetyscanners2_interfaces,
  sick_safetyscanners_base,
  substituteSource,
}:
let
  sources = rec {
    sick_safetyscanners2 = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners2-source";
        url = "https://github.com/SICKAG/sick_safetyscanners2-release.git";
        rev = "2834f96b35e26dde8b6edb5fe7edf639a8c1a977";
        hash = "sha256-i4ny7pd9nYqJwSKfiQE8KX/oMcPBPmXtcxUGiw3cx6g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safetyscanners2";
  version = "1.0.3-1";
  src = sources.sick_safetyscanners2;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost rclcpp rclcpp_lifecycle sensor_msgs sick_safetyscanners2_interfaces sick_safetyscanners_base ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
