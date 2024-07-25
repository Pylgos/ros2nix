{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  performance_test_fixture,
  rcpputils,
  substituteSource,
}:
let
  sources = rec {
    libyaml_vendor = substituteSource {
      src = fetchgit {
        name = "libyaml_vendor-source";
        url = "https://github.com/ros2-gbp/libyaml_vendor-release.git";
        rev = "6b016f94f158b7ab8e9775a7812aad155ea8e5ce";
        hash = "sha256-T5lFkF1emYzuuMStlx2KaxQi3nBCsnHhEmB9UBs1FDI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/yaml/libyaml.git";
          to = "URL ${libyaml_vendor-vendor_source-libyaml-0}";
        }
      ];
    };
    libyaml_vendor-vendor_source-libyaml-0 = substituteSource {
      src = fetchgit {
        name = "libyaml_vendor-vendor_source-libyaml-0-source";
        url = "https://github.com/yaml/libyaml.git";
        rev = "2c891fc7a770e8ba2fec34fc6b545c672beb37e6";
        hash = "sha256-S7PnooyfyAsIiRAlEPGYkgkVACGaBaCItuqOwrq2+qM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libyaml_vendor";
  version = "1.2.2-2";
  src = sources.libyaml_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
