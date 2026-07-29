import HautevilleHouse.BoundaryValueProblemsManifoldsCanonicalLaneLean.SobolevSpacePackage

namespace HautevilleHouse
namespace BoundaryValueProblemsManifoldsCanonicalLaneLean

structure TraceOperatorPackage {M : Type u} [TopologicalSpace M] {E : EllipticOperatorPackage M}
    (S : SobolevSpacePackage E) where
  traceMapDefined : Prop
  traceMapContinuous : Prop
  surjectivityOnBoundary : Prop
  kernelCharacterized : Prop

structure TraceOperatorEvidence {M : Type u} [TopologicalSpace M] {E : EllipticOperatorPackage M}
    {S : SobolevSpacePackage E} (T : TraceOperatorPackage S) where
  traceMapDefinedClosed : T.traceMapDefined
  traceMapContinuousClosed : T.traceMapContinuous
  surjectivityOnBoundaryClosed : T.surjectivityOnBoundary
  kernelCharacterizedClosed : T.kernelCharacterized

def TraceOperatorClosed {M : Type u} [TopologicalSpace M] {E : EllipticOperatorPackage M}
    {S : SobolevSpacePackage E} (T : TraceOperatorPackage S) : Prop :=
  T.traceMapDefined ∧ T.traceMapContinuous ∧ T.surjectivityOnBoundary ∧ T.kernelCharacterized

theorem trace_operator_closed_from_evidence
    {M : Type u} [TopologicalSpace M] {E : EllipticOperatorPackage M}
    {S : SobolevSpacePackage E} (T : TraceOperatorPackage S)
    (Ev : TraceOperatorEvidence T) : TraceOperatorClosed T := by
  exact And.intro Ev.traceMapDefinedClosed
    (And.intro Ev.traceMapContinuousClosed
      (And.intro Ev.surjectivityOnBoundaryClosed Ev.kernelCharacterizedClosed))

end BoundaryValueProblemsManifoldsCanonicalLaneLean
end HautevilleHouse