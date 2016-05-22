type 'a t

val regex : Re.t -> string t
val conv : ('a -> 'b) -> ('b -> 'a) -> 'a t -> 'b t

val opt : 'a t -> 'a option t
val rep : 'a t -> 'a list t
val rep1 : 'a t -> ('a * 'a list) t

val alt : 'a t -> 'b t -> [`Left of 'a | `Right of 'b] t
val seq : 'a t -> 'b t -> ('a * 'b) t

val prefix : (_ t * string) -> 'a t -> 'a t
val prefixstr : string -> 'a t -> 'a t
val suffix : 'a t -> (_ t * string) -> 'a t
val suffixstr : 'a t -> string -> 'a t

val (<?>) : 'a t -> 'b t -> [`Left of 'a | `Right of 'b] t
val (<*>) : 'a t -> 'b t -> ('a * 'b) t

val ( *>) :  string -> 'a t -> 'a t
val (<* ) : 'a t -> string -> 'a t

val ( **>) : (_ t * string) -> 'a t -> 'a t
val (<** ) : 'a t -> (_ t * string) -> 'a t


val int : int t
val pos_int : int t
val float : float t
val bool : bool t

val terminated_list : sep:string -> 'a t -> 'a list t
val separated_list : sep:string -> 'a t -> 'a list t

val parse : 'a t -> string -> 'a option

val unparse : 'a t -> 'a -> string
val unpparse : 'a t -> Format.formatter -> 'a -> unit

type 'r route = Route : 'a t * ('a -> 'r) -> 'r route
val (-->) : 'a t -> ('a -> 'r) -> 'r route

val switch :
  ?default:(string -> 'r) -> 'r route list -> string -> 'r
