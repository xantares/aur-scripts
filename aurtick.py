import AUR.RPC as RPC
import AUR.Aurtomatic as Aurtomatic
import pkgbuild
from upstream_version import get_latest_version
from distutils.version import LooseVersion, StrictVersion

rpc = RPC.AurRpc()
hits = rpc.search('mingw-w64')
for pkg in hits:
    name = pkg['PackageBase']
    if name == 'mingw-w64-gtest':
        # https://github.com/google/googletest/issues/2573
        continue
    if name.endswith('-git') or name.endswith('-svn'):
        continue
    package_version = pkg['Version'].split('-')[0]
    if ':' in package_version:
        package_version = package_version.split(':')[1]
    print(name, package_version)

    for x in RPC.download_git_repo('/tmp', [pkg]):
        srcinfo = pkgbuild.SRCINFO("/tmp/"+name+"/.SRCINFO")
        source = srcinfo.content['source']
        latest_version = get_latest_version({"url":source})
        if latest_version is not None:
            try:
                StrictVersion(latest_version)
            except ValueError:
                continue
            else:
                if StrictVersion(latest_version) > StrictVersion(package_version):
                    print("- FLAGGING:", package_version, "->", latest_version)
                    aurtomatic = Aurtomatic.Aurtomatic()
                    aurtomatic.initialize(login_file='/home/xantares/.aurtomatic')
                    aurtomatic.submit_package_form(pkg, 'flag', value="hello, version "+latest_version+ " is available")
