﻿using System.Web;
using System.Web.Mvc;

namespace K22CNT3_DinhQuocDat_2210900139
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
