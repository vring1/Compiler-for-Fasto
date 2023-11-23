let filter(p, arrExp) =
    arr = Array()
    funType = lookup(ftable, p)
    typeIn, TypeOt = match funType with
        | unbound -> error()
        | _ -> typeIn, typeOut
    typeArray = CheckExp(arrExp, vtable, ftable)
    type1 = match typeArray with
        | Array(type_of_alpha) -> type_of_alpha
        | _ -> error()
    if typeOut == Bool && type1 == typeIn then
        return Array(type1)
    else
        error()