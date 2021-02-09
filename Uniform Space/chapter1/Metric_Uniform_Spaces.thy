theory Metric_Uniform_Spaces
  imports Main "~~/src/HOL/Library/Float"
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

(*TODO: solve *)
definition uniform_continuous :: "('a::metric \<Rightarrow> 'b::metric) \<Rightarrow> bool"
  where "uniform_continuous f = (\<forall>e>0::real. \<exists>d>0::real. \<forall> x. \<forall> x'. (dist x x' < d \<longrightarrow> dist f(x) f(x') < e))"


end