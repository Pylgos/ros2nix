{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
}:
let
  sources = rec {
    hash_library_vendor = substituteSource {
      src = fetchgit {
        name = "hash_library_vendor-source";
        url = "https://github.com/ros2-gbp/hash_library_vendor-release.git";
        rev = "e31045b72d50216a20845e9bd76f689bff2f00f0";
        hash = "sha256-/aXRAfmumq2WRfhcS24fzeg13YY+hDi9NQYpVUQNR6w=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/stbrumme/hash-library.git";
          to = "URL ${hash_library_vendor-vendor_source-hash-library-0}";
        }
      ];
    };
    hash_library_vendor-vendor_source-hash-library-0 = substituteSource {
      src = fetchgit {
        name = "hash_library_vendor-vendor_source-hash-library-0-source";
        url = "https://github.com/stbrumme/hash-library.git";
        rev = "70cc93763d49a24c4536c7f0a23248f9b40e30f5";
        hash = "sha256-z4JzmggZnNfsTD8OzBiX4egJax4qJXGYr2Q8GPrInRI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hash_library_vendor";
  version = "0.1.1-3";
  src = sources.hash_library_vendor;
  nativeBuildInputs = [ ament_cmake_auto git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}