theory Metric_Uniform_Spaces
  imports Main "~~/src/HOL/Library/Float" (*"~~/src/HOL/HOLCF/Pcpo"*)
begin


declare[[show_sorts=true]] 
declare[[show_consts=true]]

(* https://mailmanbroy.informatik.tu-muenchen.de/pipermail/isabelle-dev/2019-April/016901.html *)
class psuedometic = 
  fixes dist:: "'a \<Rightarrow> 'a \<Rightarrow> real"
  assumes dist_commut [simp]: "x \<in> \<UU> \<Longrightarrow> y \<in> \<UU> \<Longrightarrow> dist x y = dist y x \<and> dist x y \<ge> 0"
      and dist_triangle: "x \<in> \<UU> \<Longrightarrow> y \<in> \<UU> \<Longrightarrow> dist x y \<le> dist x z + dist y z"

class metric = psuedometic +
  assumes dist_0_if_not_eq : "x \<in> \<UU> \<Longrightarrow> y \<in> \<UU> \<Longrightarrow> x \<noteq> y \<Longrightarrow> dist x y > 0"

definition uniform_continuous :: "('a::metric \<Rightarrow> 'b::metric) \<Rightarrow> bool"
  where "uniform_continuous f = (\<forall>e>0::real. \<exists>d>0::real. \<forall> x. \<forall> x'. (dist x x' < d \<longrightarrow> dist (f(x)) (f(x')) < e))"

(*TODO: prove "if unifrom_continuous then continuous"
definition cont :: "('a::cpo \<Rightarrow> 'b::cpo) \<Rightarrow> bool"
  where "cont f = (\<forall>Y. chain Y \<longrightarrow> range (\<lambda>i. f (Y i)) <<| f (\<Squnion>i. Y i))"
*)

(*TODO: define covering space
definition covering :: "('i \<Rightarrow> 'a::metric) set  \<Rightarrow> ('a::metric) \<Rightarrow> bool" 
  where "covering U X \<longleftrightarrow> (X \<subseteq> (\<Union> n::'i. U n))"
Operator:  (\<subseteq>) :: ??'a::type set \<Rightarrow> ??'a::type set \<Rightarrow> bool
Operand:   X::'a::metric :: 'a::metric
*)

(*
definition covering :: "('i \<Rightarrow> 'a::metric) set  \<Rightarrow> ('a::metric) \<Rightarrow> bool" 
  where "covering U X \<longleftrightarrow> (\<forall> x \<in> X. \<exists> n::'i. x \<in> (U n))"
Operator:  Ball :: ??'a::type set \<Rightarrow> (??'a::type \<Rightarrow> bool) \<Rightarrow> bool
Operand:   X::'a::metric :: 'a::metric
*)

(*TODO: 
- define uniform_covering
- prove the relation between uniform_covering and neighborhood
- prove the relation between uniformly continuous functoin and unifrom covering
*)

(*TODO: define uniform_equivalence
*)

end