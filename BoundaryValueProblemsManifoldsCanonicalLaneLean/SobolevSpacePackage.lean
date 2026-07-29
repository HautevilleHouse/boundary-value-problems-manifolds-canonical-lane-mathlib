import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BoundaryValueProblemsManifoldsCanonicalLaneLean.PoissonEquationPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure SobolevSpacePackage where
  sobolevNormsDefined : Prop
  embeddingTheorems : Prop
  traceTheorems : Prop
  compactEmbedding : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  sobolevNormsDefinedClosed : S.sobolevNormsDefined
  embeddingTheoremsClosed : S.embeddingTheorems
  traceTheoremsClosed : S.traceTheorems
  compactEmbeddingClosed : S.compactEmbedding

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.sobolevNormsDefined ∧ S.embeddingTheorems ∧ S.traceTheorems ∧ S.compactEmbedding

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage) (E : SobolevSpaceEvidence S) : SobolevSpaceClosed S := by
  exact And.intro E.sobolevNormsDefinedClosed (And.intro E.embeddingTheoremsClosed (And.intro E.traceTheoremsClosed E.compactEmbeddingClosed))

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse