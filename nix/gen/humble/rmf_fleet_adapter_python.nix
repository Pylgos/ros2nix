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
        rev = "81a89fc936aeac0e1be972b8163cfad9c9d02d25";
        hash = "sha256-oZKPcZGr1K9jH+5pSUxlwfCYuDsQYMg72rR53PPMQNQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_fleet_adapter_python";
  version = "2.1.8-1";
  src = sources.rmf_fleet_adapter_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pybind11_json_vendor pybind11_vendor rclpy rmf_fleet_adapter ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
