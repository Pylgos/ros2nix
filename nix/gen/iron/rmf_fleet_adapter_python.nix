{
  ament_cmake_pytest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pybind11_json_vendor,
  pybind11_vendor,
  rclpy,
  rmf_fleet_adapter,
  substituteSource,
}:
let
  sources = rec {
    rmf_fleet_adapter_python = substituteSource {
      src = fetchgit {
        name = "rmf_fleet_adapter_python-source";
        url = "https://github.com/ros2-gbp/rmf_ros2-release.git";
        rev = "619b6dcf135f7e6e52917d0661077035127d4230";
        hash = "sha256-pbAKORxSO+2S8wowI6qAD3wH0fDvNlsr6mBwgLb0SYQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_fleet_adapter_python";
  version = "2.2.5-1";
  src = sources.rmf_fleet_adapter_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pybind11_json_vendor pybind11_vendor rclpy rmf_fleet_adapter ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
