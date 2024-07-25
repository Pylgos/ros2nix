{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    qb_softhand_industry_msgs = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry_msgs-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "e45e2fb47eb478c003c669bac3442b7dfbf9d3ad";
        hash = "sha256-IknmBLuGSGa0xZeNSAOKXqakU5+BUOxkzEf+yjI28WQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_softhand_industry_msgs";
  version = "2.1.2-4";
  src = sources.qb_softhand_industry_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
