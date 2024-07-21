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
    gtsam = substituteSource {
      src = fetchgit {
        name = "gtsam-source";
        url = "https://github.com/ros2-gbp/gtsam-release.git";
        rev = "b3a199bd675027475f53cd0cf40d48c0825e3ade";
        hash = "sha256-pB7YNdBRIvvJ21JFD/rNx7KcYzVzXMLJcyUyVg6w8Zk=";
      };
      substitutions = [
        {
          path = "gtsam/3rdparty/Eigen/lapack/CMakeLists.txt";
          from = "DOWNLOAD \"http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz\"";
          to = "DOWNLOAD file://${gtsam-vendor_source0}";
        }
      ];
    };
    gtsam-vendor_source0 = substituteSource {
      src = fetchurl {
        name = "gtsam-vendor_source0-source";
        url = "http://downloads.tuxfamily.org/eigen/lapack_addons_3.4.1.tgz";
        hash = "sha256-vZntt9xHKapjGQQapStG2/erraGkP3oj/iYm2yTFJDw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gtsam";
  version = "4.2.0-2";
  src = sources.gtsam;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ eigen python3Packages.boost tbb ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
