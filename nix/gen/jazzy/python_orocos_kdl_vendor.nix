{
  ament_cmake,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  orocos_kdl_vendor,
  pybind11_vendor,
  python3Packages,
  python_cmake_module,
  substituteSource,
}:
let
  sources = rec {
    python_orocos_kdl_vendor = substituteSource {
      src = fetchgit {
        name = "python_orocos_kdl_vendor-source";
        url = "https://github.com/ros2-gbp/orocos_kdl_vendor-release.git";
        rev = "d1d43bdb1c1352d9e431c857e7bc6537c2ff680b";
        hash = "sha256-vl1eKkJp/P4mQsOWDBIWnCOpp/m2LB18yxZI9GWgaYY=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/orocos/orocos_kinematics_dynamics/archive/ce4bcb65a050615b6d7f21bc60fbb2656515791b.zip";
          to = "URL ${python_orocos_kdl_vendor-vendor_source-ce4bcb65a050615b6d7f21bc60fbb2656515791b-0}";
        }
      ];
    };
    python_orocos_kdl_vendor-vendor_source-ce4bcb65a050615b6d7f21bc60fbb2656515791b-0 = substituteSource {
      src = fetchzip {
        name = "python_orocos_kdl_vendor-vendor_source-ce4bcb65a050615b6d7f21bc60fbb2656515791b-0-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics/archive/ce4bcb65a050615b6d7f21bc60fbb2656515791b.zip";
        hash = "sha256-JXNOS6uV6ls3eMI53sBkX+zJfiVUakbK6iLlzPlD1+8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "python_orocos_kdl_vendor";
  version = "0.5.1-2";
  src = sources.python_orocos_kdl_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_python python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ orocos_kdl_vendor pybind11_vendor python3Packages.pykdl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
