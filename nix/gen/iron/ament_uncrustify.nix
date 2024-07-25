{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_pycodestyle,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  substituteSource,
  uncrustify_vendor,
}:
let
  sources = rec {
    ament_uncrustify = substituteSource {
      src = fetchgit {
        name = "ament_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "866fca037096f5cf96effd2119475415c0f89e6c";
        hash = "sha256-MSQuZpmN5znu9wbZ5yY6wzQCbYiVgCvMcNKCWnRq0hs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_uncrustify";
  version = "0.14.3-1";
  src = sources.ament_uncrustify;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ uncrustify_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ uncrustify_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
