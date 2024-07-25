{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  assimp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rviz_assimp_vendor = substituteSource {
      src = fetchgit {
        name = "rviz_assimp_vendor-source";
        url = "https://github.com/ros2-gbp/rviz-release.git";
        rev = "c0c3d1fad4e36c8e6111f24a5675a0fc343e9efe";
        hash = "sha256-9iCIPhiUAQ4Oz0539xR0lxWrrxQMgq2JlkYUv0GHD1k=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/assimp/assimp/archive/v4.1.0.tar.gz";
          to = "URL ${rviz_assimp_vendor-vendor_source-v4-0}";
        }
      ];
    };
    rviz_assimp_vendor-vendor_source-v4-0 = substituteSource {
      src = fetchzip {
        name = "rviz_assimp_vendor-vendor_source-v4-0-source";
        url = "https://github.com/assimp/assimp/archive/v4.1.0.tar.gz";
        hash = "sha256-mTCK3Rud8Fwl8wtWSqTakYr7Tkd1X2bl/9rVHscL5gE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rviz_assimp_vendor";
  version = "12.4.7-1";
  src = sources.rviz_assimp_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ assimp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
