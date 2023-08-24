const routes = {
  UI: {
    BUYERS_DAILY_NOMINATION: () => "/reports/daily_buyers_nomination",
    DAILY_BUYERS_NOTIFICATION: () => "/reports/daily_buyers_notification",
    DAILY_GAS_NETWORK_EVENT_LOG: () => "/",
    DAILY_GAS_OFFTAKE_REQUEST: () => "/reports/daily_gas_offtake_request",
    DAILY_GAS_OPERATIONS: () => "/reports/daily_gas_operations",
    DCV_DECLARATION: () => "/reports/dcv_declaration",
    GAS_SCHEDULERS_LOG: () => "/reports/gas_schedulers_log",
    MONTHLY_DVC_DECLARATION: () => "/reports/monthly_dvc_declaration",
    MONTHLY_PNV: () => "/reports/monthly_pnv",
  },
  API: {
    GET_CLIENTS: (params = undefined) => {
      const searchParams = new URLSearchParams(params).toString();
    
      if (searchParams) return `/Clients?${searchParams}`

      return `/Clients`
    },
    GET_EVENTS: (params = undefined) => {
      const searchParams = new URLSearchParams(params).toString();
    
      if (searchParams) return `/Events?${searchParams}`

      return `/Events`
    },
    GET_NOMINATIONS: (params = undefined) => {
      const searchParams = new URLSearchParams(params).toString();
    
      if (searchParams) return `/Nominations?${searchParams}`

      return `/Nominations`
    },
    GET_OFFTAKE_REQUESTS: (params = undefined) => {
      const searchParams = new URLSearchParams(params).toString();
    
      if (searchParams) return `/GasOfftakeRequest?${searchParams}`

      return `/GasOfftakeRequest`
    },
    GET_TAG_PNVS: (params = undefined) => {
      const searchParams = new URLSearchParams(params).toString();
    
      if (searchParams) return `/TagPnv?${searchParams}`

      return `/TagPnv`
    },
    GET_DCV_DECALRATIONS: (params = undefined) => {
      const searchParams = new URLSearchParams(params).toString();
    
      if (searchParams) return `/DcvDeclarationS?${searchParams}`

      return `/DcvDeclarations`
    }

  }
};
  
  export default routes;
  