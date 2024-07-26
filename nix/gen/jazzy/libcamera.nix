{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libyaml,
  openssl,
  pkg-config,
  python3,
  python3Packages,
  substituteSource,
  udev,
}:
let
  sources = rec {
    libcamera = substituteSource {
      src = fetchgit {
        name = "libcamera-source";
        url = "https://github.com/ros2-gbp/libcamera-release.git";
        rev = "8722fe191723f74cd203b007bc4e228ccd8de4d6";
        hash = "sha256-JmZ0j75Bh3/iVK8U2l/7P3kF9nswD54/DEQBvhfeCV8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcamera";
  version = "0.3.0-3";
  src = sources.libcamera;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ pkg-config python3 buildPackages.python3Packages.jinja2 buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyaml openssl python3Packages.pybind11 udev ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
