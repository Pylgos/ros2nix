{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  substituteSource,
  wireless_msgs,
  wirelesstools,
}:
let
  sources = rec {
    wireless_watcher = substituteSource {
      src = fetchgit {
        name = "wireless_watcher-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "93de4dbf790dc272be12cf2db8584fb9123e821a";
        hash = "sha256-Kc1OsYFra5wtIXSWXAPR5r3zY2Napa+8/zVsMmZPcio=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "wireless_watcher";
  version = "1.1.0-1";
  src = sources.wireless_watcher;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp wireless_msgs wirelesstools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
