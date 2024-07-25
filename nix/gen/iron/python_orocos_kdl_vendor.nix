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
        rev = "4a41c95215742748970a85c3bdc9a2e5b417ef31";
        hash = "sha256-x4xJ/ugl2IkKnTrezCQgIrkPr3KR+KI1Q7+Y69Wggis=";
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
  version = "0.3.4-3";
  src = sources.python_orocos_kdl_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_python python_cmake_module ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ orocos_kdl_vendor pybind11_vendor python3Packages.pykdl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
