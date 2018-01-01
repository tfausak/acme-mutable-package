import Distribution.PackageDescription.Parse
import Distribution.Simple
import Distribution.Types.GenericPackageDescription
import Distribution.Types.PackageDescription

main :: IO ()
main = defaultMainWithHooks simpleUserHooks
  { preBuild = \ args flags -> do
    package <- readGenericPackageDescription minBound "acme-mutable-package.cabal"
    writeFile "AcmeMutablePackage.lhs" (description (packageDescription package))
    preBuild simpleUserHooks args flags
  }
