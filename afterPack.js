const { execSync } = require('child_process');

exports.default = async function(context) {
  const appPath = context.appOutDir + '/' + context.packager.appInfo.productFilename + '.app';
  console.log('  • removing xattrs from', appPath);
  try {
    execSync(`xattr -cr "${appPath}"`, { stdio: 'inherit' });
  } catch (e) {
    console.warn('  ⚠ xattr warning:', e.message);
  }
};
