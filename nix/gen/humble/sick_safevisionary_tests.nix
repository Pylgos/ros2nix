{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  sick_safevisionary_driver,
  substituteSource,
}:
let
  sources = rec {
    sick_safevisionary_tests = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_tests-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
        rev = "e2f4b3bc8b665dd45f89ce6718650b2e8612394a";
        hash = "sha256-Q8HR5ihqZXIb5vP+goYKCgxgf635GsyPBnh2t5oPkgI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safevisionary_tests";
  version = "1.0.3-1";
  src = sources.sick_safevisionary_tests;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
