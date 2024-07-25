{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libyaml,
  openssl,
  pkg-config,
  substituteSource,
  udev,
}:
let
  sources = rec {
    libcamera = substituteSource {
      src = fetchgit {
        name = "libcamera-source";
        url = "https://github.com/ros2-gbp/libcamera-release.git";
        rev = "78abec9fda1fc411ab979ab573f69e47a534e07d";
        hash = "sha256-bE1/k7PsHhmFY+AZfzMZcHIutRovYK63Hxa898NpC5I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libcamera";
  version = "0.1.0-1";
  src = sources.libcamera;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ pkg-config buildPackages.python3Packages.jinja2 buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libyaml openssl udev ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
