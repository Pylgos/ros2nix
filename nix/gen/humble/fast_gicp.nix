{
  ament_cmake,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  pcl,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    fast_gicp = substituteSource {
      src = fetchgit {
        name = "fast_gicp-source";
        url = "https://github.com/ros2-gbp/fast_gicp-release.git";
        rev = "2df9bd9c735513ed193ce6b27f8851ee01245a67";
        hash = "sha256-NaIYVgSEOGUwgQ/LKzFWxJjrm93GH0Mp7cW2JZiQn/U=";
      };
      substitutions = [
        {
          path = "thirdparty/Eigen/lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${fast_gicp-vendor_source-lapack_addons_3-0}";
        }
      ];
    };
    fast_gicp-vendor_source-lapack_addons_3-0 = substituteSource {
      src = fetchurl {
        name = "fast_gicp-vendor_source-lapack_addons_3-0-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fast_gicp";
  version = "0.0.0-1";
  src = sources.fast_gicp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen pcl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
