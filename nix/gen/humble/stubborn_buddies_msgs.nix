{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    stubborn_buddies_msgs = substituteSource {
      src = fetchgit {
        name = "stubborn_buddies_msgs-source";
        url = "https://github.com/ros2-gbp/stubborn_buddies-release.git";
        rev = "74872db5cd5c59c9c27ab80bf224d9fab38f375e";
        hash = "sha256-ca+tBYzurY7xkoSry24RR8HaTLuuHAEKuBOxT57QSXY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "stubborn_buddies_msgs";
  version = "1.0.0-5";
  src = sources.stubborn_buddies_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
