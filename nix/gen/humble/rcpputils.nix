{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_gen_version_h,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcutils,
  substituteSource,
}:
let
  sources = rec {
    rcpputils = substituteSource {
      src = fetchgit {
        name = "rcpputils-source";
        url = "https://github.com/ros2-gbp/rcpputils-release.git";
        rev = "de40e35afb18417e02eb1fab9393babb7497043f";
        hash = "sha256-oYX0CXLvGaHesC7LHzD1Cr5JvEpSzWQMAWLuTv6FICw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcpputils";
  version = "2.4.3-1";
  src = sources.rcpputils;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}