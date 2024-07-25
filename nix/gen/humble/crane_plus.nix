{
  ament_cmake,
  buildRosPackage,
  crane_plus_control,
  crane_plus_description,
  crane_plus_examples,
  crane_plus_gazebo,
  crane_plus_moveit_config,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    crane_plus = substituteSource {
      src = fetchgit {
        name = "crane_plus-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "2000776fbfae0026c328aa3a72359071c5484d0a";
        hash = "sha256-Lbvvb2nbBaqxXwiRHQUhm+oHVOoiK5WLgNqb2N9vImA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "crane_plus";
  version = "2.0.1-1";
  src = sources.crane_plus;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ crane_plus_control crane_plus_description crane_plus_examples crane_plus_gazebo crane_plus_moveit_config ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
