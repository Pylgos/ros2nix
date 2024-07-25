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
        rev = "8cd99798448ebd98447a35af86b1626abe7813d8";
        hash = "sha256-PYtcHErPdFtIDbcz/XX1DVOn5Yj/mMaj0D4vmUFqkKA=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "URL https://github.com/orocos/orocos_kinematics_dynamics/archive/507de66205e14b12c8c65f25eafc05c4dc66e21e.zip";
          to = "URL ${python_orocos_kdl_vendor-vendor_source-507de66205e14b12c8c65f25eafc05c4dc66e21e-0}";
        }
      ];
    };
    python_orocos_kdl_vendor-vendor_source-507de66205e14b12c8c65f25eafc05c4dc66e21e-0 = substituteSource {
      src = fetchzip {
        name = "python_orocos_kdl_vendor-vendor_source-507de66205e14b12c8c65f25eafc05c4dc66e21e-0-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics/archive/507de66205e14b12c8c65f25eafc05c4dc66e21e.zip";
        hash = "sha256-4x7nZw04MWFJkvPnnH+w/E6ystOdi8QjSMm+omQ0Z8Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "python_orocos_kdl_vendor";
  version = "0.2.5-1";
  src = sources.python_orocos_kdl_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_python python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ orocos_kdl_vendor pybind11_vendor python3Packages.pykdl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
