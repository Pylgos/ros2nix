{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_license = substituteSource {
      src = fetchgit {
        name = "ecl_license-source";
        url = "https://github.com/ros2-gbp/ecl_tools-release.git";
        rev = "9035ca0ee4fe6e0c98c3569574f200b37127153f";
        hash = "sha256-7IkZyQJw9go1s2je+YLPGemSTMtC8PNA66qCC6akU6w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_license";
  version = "1.0.3-2";
  src = sources.ecl_license;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
