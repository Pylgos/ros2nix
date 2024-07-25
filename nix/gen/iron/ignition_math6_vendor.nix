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
        url = "https://github.com/ros2-gbp/gz_math6_vendor-release.git";
        rev = "88acfdfcfab59aafa31b7230f387323e76579e1f";
        hash = "sha256-KNH3OwcOCNrthK+uJHbE53Al3oXi3tjnc4zIWlwrccU=";
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
  version = "0.1.0-1";
  src = sources.ignition_math6_vendor;
  nativeBuildInputs = [ ament_cmake_test cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen ignition_cmake2_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
