{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  curl,
  fetchgit,
  fetchurl,
  fetchzip,
  openssl,
  substituteSource,
  zlib,
}:
let
  sources = rec {
    aws_sdk_cpp_vendor = substituteSource {
      src = fetchgit {
        name = "aws_sdk_cpp_vendor-source";
        url = "https://github.com/ros2-gbp/aws_sdk_cpp_vendor-release.git";
        rev = "e95a1b248df3312aa13722247ac8d9476ea35770";
        hash = "sha256-y9V12GcuRTRxl5BbMVNzmPIoC3qIhoGQhgK3kjmd1xs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aws_sdk_cpp_vendor";
  version = "0.2.1-1";
  src = sources.aws_sdk_cpp_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package curl ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ openssl zlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
