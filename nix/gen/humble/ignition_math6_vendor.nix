{
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_xmllint,
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  ignition_cmake2_vendor,
  substituteSource,
}:
let
  sources = rec {
    ignition_math6_vendor = substituteSource {
      src = fetchgit {
        name = "ignition_math6_vendor-source";
        url = "https://github.com/ros2-gbp/ignition_math6_vendor-release.git";
        rev = "b5212d1728b71644c7c817796bb37ec7fa33b46b";
        hash = "sha256-HR32tjvnD5KaVPw4YWj43yrNsA3PGhuwcALJlBciHYQ=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ignitionrobotics/ign-math.git";
          to = "URL ${ignition_math6_vendor-vendor_source-ign-math-0}";
        }
      ];
    };
    ignition_math6_vendor-vendor_source-ign-math-0 = substituteSource {
      src = fetchgit {
        name = "ignition_math6_vendor-vendor_source-ign-math-0-source";
        url = "https://github.com/ignitionrobotics/ign-math.git";
        rev = "23bf73a3f88fc8fe6d86c00cc8d304f52be1f264";
        hash = "sha256-yR9QjREmIdXaCxwjNBhFJZpw8x5V0FfdmcD0eB0cAhI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ignition_math6_vendor";
  version = "0.0.2-2";
  src = sources.ignition_math6_vendor;
  nativeBuildInputs = [ ament_cmake_test cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ignition_cmake2_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
