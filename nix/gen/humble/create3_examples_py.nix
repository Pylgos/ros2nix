{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  irobot_create_msgs,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    create3_examples_py = substituteSource {
      src = fetchgit {
        name = "create3_examples_py-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "38bbfa17b3927b678da411c1420c0da56065d9b7";
        hash = "sha256-AqZNTwZugSdPoEG0ovRww8W7EE7Wg+NfukJlVl5h9VA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create3_examples_py";
  version = "0.0.5-1";
  src = sources.create3_examples_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs irobot_create_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
