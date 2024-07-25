{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
  uncrustify,
}:
let
  sources = rec {
    uncrustify_vendor = substituteSource {
      src = fetchgit {
        name = "uncrustify_vendor-source";
        url = "https://github.com/ros2-gbp/uncrustify_vendor-release.git";
        rev = "e2bddd9df7abe1099ea9788e5b3811adabe9481e";
        hash = "sha256-1oT+X1kC2I2bIsLMlfVIhm5D+Arco2V57zY3i08gUII=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/uncrustify/uncrustify.git";
          to = "URL ${uncrustify_vendor-vendor_source-uncrustify-0}";
        }
      ];
    };
    uncrustify_vendor-vendor_source-uncrustify-0 = substituteSource {
      src = fetchgit {
        name = "uncrustify_vendor-vendor_source-uncrustify-0-source";
        url = "https://github.com/uncrustify/uncrustify.git";
        rev = "1d3d8fa5e81bece0fac4b81316b0844f7cc35926";
        hash = "sha256-ZVC5tsn2m1uB7EPNJFPLWLZpLSk4WrFOgJvy1KFYqBY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "uncrustify_vendor";
  version = "2.0.2-2";
  src = sources.uncrustify_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [ uncrustify ];
  buildInputs = [ ament_cmake git ];
  propagatedBuildInputs = [ uncrustify ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
