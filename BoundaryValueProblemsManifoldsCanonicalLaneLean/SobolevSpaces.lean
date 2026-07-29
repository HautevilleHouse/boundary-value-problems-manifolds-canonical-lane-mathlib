import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure SobolevSpacePackage where
  manifold : Type u
  exponent : Type v
  normDefined : Prop
  completeness : Prop
  compactEmbedding : Prop

structure SobolevSpaceEvidence (S : SobolevSpacePackage) where
  normDefinedClosed : S.normDefined
  completenessClosed : S.completeness
  compactEmbeddingClosed : S.compactEmbedding

def SobolevSpaceClosed (S : SobolevSpacePackage) : Prop :=
  S.normDefined ∧ S.completeness ∧ S.compactEmbedding

theorem sobolev_space_closed_from_evidence (S : SobolevSpacePackage) (E : SobolevSpaceEvidence S) :
    SobolevSpaceClosed S := by
  exact And.intro E.normDefinedClosed (And.intro E.completenessClosed E.compactEmbeddingClosed)

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse
