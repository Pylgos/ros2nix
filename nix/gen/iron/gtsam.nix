{
  buildRosPackage,
  cmake,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
  tbb,
}:
let
  sources = rec {
    fast_gicp-vendor_source-lapack_addons_3-0 = substituteSource {
      src = fetchurl {
        name = "fast_gicp-vendor_source-lapack_addons_3-0-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
    gtsam = substituteSource {
      src = fetchgit {
        name = "gtsam-source";
        url = "https://github.com/ros2-gbp/gtsam-release.git";
        rev = "a77ec2a449cc228b4cd6484f53cef56924021d0e";
        hash = "sha256-1KJ7zOWnzNuLLZnjKq/VVWmn/K4/dxPqH+s3wJHVXTY=";
      };
      substitutions = [
        {
          path = "gtsam/3rdparty/Eigen/lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${fast_gicp-vendor_source-lapack_addons_3-0}";
        }
      ];
    };
  };
in
buildRosPackage {
  pname = "gtsam";
  version = "4.2.0-5";
  src = sources.gtsam;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.boost tbb ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
