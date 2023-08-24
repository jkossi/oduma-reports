import { Outlet, Link } from "react-router-dom";
import routes from "~/utils/constants/routes";

function MainLayout() {
  return (
    <div className="lg:ml-72 xl:ml-80">
      <header className="contents lg:pointer-events-none lg:fixed lg:inset-0 lg:z-40 lg:flex">
        <div className="contents lg:pointer-events-auto lg:block lg:w-72 lg:overflow-y-auto lg:border-r lg:border-zinc-900/10 lg:pb-8 lg:pt-4 xl:w-80">
          <div className="hidden border-b pb-4 pl-4 lg:flex">
            <a href="Home">
              <h1 className="font-semibold">WCCG Data Reports</h1>
            </a>
          </div>
          <nav className="hidden lg:mt-8 lg:block lg:pl-4">
            <ul role="list">
              <li className="py-1.5">
                <Link to={routes.UI.DAILY_GAS_NETWORK_EVENT_LOG()}>Daily Gas Network Event Log</Link>  
              </li>
              <li className="py-1.5">
                <Link to={routes.UI.BUYERS_DAILY_NOMINATION()}>Buyer&apos;s Daily Nomination</Link>  
              </li>
              <li className="py-1.5">
                <Link to={routes.UI.MONTHLY_DVC_DECLARATION()}>Monthly DVC Declaration</Link>  
              </li>
              <li className="py-1.5">
                <Link to={routes.UI.DAILY_GAS_OFFTAKE_REQUEST()}>Daily Gas Offtake Request</Link>  
              </li>
              <li className="py-1.5">
                <Link to={routes.UI.MONTHLY_PNV()}>Monthly PNV</Link>  
              </li>
              <li className="py-1.5">
                <Link to={routes.UI.DAILY_BUYERS_NOTIFICATION()}>Daily Buyers Notification</Link>  
              </li>
              <li className="py-1.5">
                <Link to={routes.UI.GAS_SCHEDULERS_LOG()}>Gas Schedulers Log</Link>  
              </li>
              <li className="py-1.5">
                <Link to={routes.UI.DAILY_BUYERS_NOTIFICATION()}>Daily Buyer&apos;s Notification</Link>  
              </li>
              <li className="py-1.5">
                <Link to={routes.UI.DAILY_GAS_OPERATIONS()}>Daily Gas Operations</Link>  
              </li>
            </ul>
          </nav>
        </div>
      </header>
      <div className="relative px-4 pt-4 sm:px-6 lg:px-8">
        <Outlet />
      </div>
    </div>
  );
}

export default MainLayout;
