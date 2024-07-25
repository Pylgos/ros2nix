{
  ament_cmake_flake8,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy,
  launch_ros,
  python3Packages,
  substituteSource,
  teleop_twist_joy,
  teleop_twist_keyboard,
}:
let
  sources = rec {
    create3_teleop = substituteSource {
      src = fetchgit {
        name = "create3_teleop-source";
        url = "https://github.com/ros2-gbp/create3_examples-release.git";
        rev = "5973ccabce0d22732926b8ca66902927aa32c984";
        hash = "sha256-sWt5GKeHC6/GIrP2iq8i4nd7O5DIwjF7tIVtFg3ChE8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "create3_teleop";
  version = "0.0.5-1";
  src = sources.create3_teleop;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joy launch_ros teleop_twist_joy teleop_twist_keyboard ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
