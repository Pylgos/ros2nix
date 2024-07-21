{
  ament_cmake,
  ament_cmake_vendor_package,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  uncrustify,
}:
let
  sources = rec {
    uncrustify_vendor = substituteSource {
      src = fetchgit {
        name = "uncrustify_vendor-source";
        url = "https://github.com/ros2-gbp/uncrustify_vendor-release.git";
        rev = "69a8304c634ed4b0872634acbc73bc1854510fff";
        hash = "sha256-yVmdBegpkwKPCWppTjfeJpLZn9LCFAPVsI0sy2mZvpw=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/uncrustify/uncrustify.git";
          to = "VCS_TYPE path VCS_URL ${uncrustify_vendor-vendor_source0}";
        }
      ];
    };
    uncrustify_vendor-vendor_source0 = substituteSource {
      src = fetchgit {
        name = "uncrustify_vendor-vendor_source0-source";
        url = "https://github.com/uncrustify/uncrustify.git";
        rev = "b8c95286f70ef8e0e83bd055a3a7aabb614a0781";
        hash = "sha256-L+YEVZC7sIDYuCM3xpSfZLjA3B8XsW5hi+zV2NEgXTs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "uncrustify_vendor";
  version = "3.0.0-2";
  src = sources.uncrustify_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ uncrustify ];
  buildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedBuildInputs = [ uncrustify ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
