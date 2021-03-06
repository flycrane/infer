(*
* Copyright (c) 2009 -2013 Monoidics ltd.
* Copyright (c) 2013 - Facebook.
* All rights reserved.
*)

open Javalib_pack
open Sawja_pack

(** [path_of_cached_classname cn] returns the path of a cached classname *)
val path_of_cached_classname : JBasics.class_name -> string

(** [cache_classname cn] stores the classname to the disk *)
val cache_classname : JBasics.class_name -> unit

(** [is_classname_cached cn]  *)
val is_classname_cached : JBasics.class_name -> bool

(** [compute_icfg linereader classes program tenv source_basename source_file] create the call graph and control flow graph for the file [source_file] by translating all the classes in [program] originating from [source_file] *)
val compute_source_icfg :
Inferconfig.NeverReturnNull.matcher ->
Printer.LineReader.t ->
JBasics.ClassSet.t ->
JClasspath.program ->
Sil.tenv ->
string ->
DB.source_file ->
Cg.t * Cfg.cfg

(** Compute the CFG for a class *)
val compute_class_icfg :
Inferconfig.NeverReturnNull.matcher ->
Printer.LineReader.t ->
JClasspath.program ->
Sil.tenv ->
JCode.jcode Javalib.interface_or_class ->
DB.source_file ->
Cg.t * Cfg.cfg
