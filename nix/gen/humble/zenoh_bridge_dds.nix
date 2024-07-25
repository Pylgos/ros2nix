{
  ament_cmake,
  buildRosPackage,
  cargo,
  clang,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    zenoh_bridge_dds = substituteSource {
      src = fetchgit {
        name = "zenoh_bridge_dds-source";
        url = "https://github.com/ros2-gbp/zenoh_bridge_dds-release.git";
        rev = "e51afe4ee9946c800b0afab583eba7faa4445afe";
        hash = "sha256-f7l+qyV5vSYtTVBV57bVQUV49odL51NPVkvmo00gimY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zenoh_bridge_dds";
  version = "0.5.0-3";
  src = sources.zenoh_bridge_dds;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ clang ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cargo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
