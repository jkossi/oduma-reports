import { useForm, useWatch } from "react-hook-form";
import { format } from "date-fns";
import useSWR from "swr";
import { getEvents } from "~/services/reportService";
import networkEventLogs from "~/data/network_event_logs";
import routes from "~/utils/constants/routes";

function DailyGasNetworkEventLog() {
  const { register, control } = useForm({
    mode: "onBlur",
    defaultValues: {
      fromDate: "",
      toDate: "",
      clientId: "",
    },
  });

  const { fromDate, toDate, clientId } = useWatch({ control });
  const { data, error, isLoading } = useSWR(
    routes.API.GET_EVENTS({ fromDate, toDate, clientId }),
    getEvents
  );

  return (
    <section>
      <h1 className="text-2xl font-bold tracking-tight text-gray-900">
        Daily Gas Network Event Log
      </h1>
      <form className="mt-4">
        <h2 className="mb-4">Filters</h2>
        <div className="grid grid-cols-1 gap-x-8 gap-y-6 sm:grid-cols-3">
          <div>
            <label
              htmlFor="from-date"
              className="block text-sm font-semibold leading-6 text-gray-900"
            >
              From
            </label>
            <div className="mt-2.5">
              <input
                type="date"
                id="from-date"
                className="block w-full rounded-md border-0 px-2.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                {...register("fromDate")}
              />
            </div>
          </div>
          <div>
            <label
              htmlFor="to-date"
              className="block text-sm font-semibold leading-6 text-gray-900"
            >
              To
            </label>
            <div className="mt-2.5">
              <input
                type="date"
                id="to-date"
                className="block w-full rounded-md border-0 px-2.5 py-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
                {...register("toDate")}
              />
            </div>
          </div>
          <div>
            <label
              htmlFor="client"
              className="block text-sm font-semibold leading-6 text-gray-900"
            >
              Client
            </label>
            <div className="mt-2.5">
              <select
                id="client"
                className="block w-full rounded-md border-0 px-2.5 py-3 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6"
                {...register("clientId")}
              >
                <option value="">Select Client</option>
                <option value="22">SAPP</option>
                <option value="11">Jubilee</option>
                <option value="p">Cenpower</option>
              </select>
            </div>
          </div>
        </div>
      </form>

      <hr className="mt-8" />

      {isLoading && (
        <div className="mt-5 text-center text-sm text-gray-500">Loading...</div>
      )}
      {!isLoading && error && (
        <div className="mt-5 text-center text-xs text-red-500">
          Sorry! we have a little problem. Refresh the page and try again...
        </div>
      )}
      {!data && (
        <table className="mb-8 mt-8 table-fixed border-collapse border border-black">
          <caption className="caption-top py-4">
            {fromDate && toDate && (
              <h3>{`${format(new Date(fromDate), "dd MMM, yyyy")} - ${format(
                new Date(toDate),
                "dd MMM, yyyy"
              )}`}</h3>
            )}
          </caption>
          <thead>
            <tr>
              <th colspan="5" className="bg-dark-blue">
                <div className="p-3 text-white">
                  <h2 className=" text-2xl">GAS NETWORK EVENT LOG</h2>
                  {fromDate && toDate && (
                    <h3>
                      (
                      {`${format(
                        new Date(fromDate),
                        "dd MMM, yyyy"
                      )} - ${format(new Date(toDate), "dd MMM, yyyy")}`}
                      )
                    </h3>
                  )}
                </div>
              </th>
            </tr>
            <tr className="bg-bright-yellow text-black">
              <th className="border border-black">Date</th>
              <th className="border border-black">Description of Event</th>
              <th className="border border-black">Time</th>
              <th className="border border-black">Reason</th>
              <th className="border border-black">Informing parties</th>
            </tr>
          </thead>
          <tbody>
            {networkEventLogs.map((log) => (
              <tr key={log.eventID}>
                <td className="border border-black p-4 text-black">
                  {format(new Date(log.date), "dd MMM, yyyy")}
                </td>
                <td className="border border-black p-2 text-black">
                  {log.description}
                </td>
                <td className="border border-black p-2 text-black">
                  {log.time}
                </td>
                <td className="border border-black p-2 text-black">
                  {log.reason}
                </td>
                <td className="border border-black p-2 text-black">
                  {log.updatedBy}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </section>
  );
}

export default DailyGasNetworkEventLog;
