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
        rev = "a304c5813ef79237ee0996be9c5aee5fa9e1c1dc";
        hash = "sha256-IrWspRQCLirNJ7Y1cLy3uzuvENbHmiLgfUNF4nwsRxw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_fleet_adapter_python";
  version = "2.7.1-1";
  src = sources.rmf_fleet_adapter_python;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pybind11_json_vendor pybind11_vendor rclpy rmf_fleet_adapter ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
