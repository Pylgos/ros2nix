{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rosidl_parser,
  std_msgs,
  std_srvs,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    rosidl_runtime_py = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_py-source";
        url = "https://github.com/ros2-gbp/rosidl_runtime_py-release.git";
        rev = "c4ee1fff1e977297ab98fd48657c7788a1ef5152";
        hash = "sha256-MUYbiVx360VWn/HJ8UHL02+QwvfOKxMZj+B+NvOLdHk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_py";
  version = "0.9.3-1";
  src = sources.rosidl_runtime_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy buildPackages.python3Packages.pyyaml rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
