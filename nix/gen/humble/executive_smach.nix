{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  smach,
  smach_msgs,
  smach_ros,
  substituteSource,
}:
let
  sources = rec {
    executive_smach = substituteSource {
      src = fetchgit {
        name = "executive_smach-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "738bfe46089b46925a5a1748cd9fe232e88c722d";
        hash = "sha256-68w8XZNadjLJdkgr+OVVW8Stg9rqS5wqQgYUxlZtOo0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "executive_smach";
  version = "3.0.3-1";
  src = sources.executive_smach;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ smach smach_msgs smach_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
