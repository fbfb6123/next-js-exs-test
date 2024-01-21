import { Store } from "@/types";
import StoreList from "./components/stores/StoreList";


export default async function Home() {
  const API_URL = process.env.NEXT_PUBLIC_API_URL;
  const res = await fetch(`${API_URL}/api/store`, { cache: "no-store" });
  const stores = await res.json();

  return (
    <section className="text-gray-600 body-font">
      <div className="container px-5 py-5 mx-auto">
        <div className="flex flex-wrap -mx-4 -mb-10 text-center">
          <StoreList stores={stores} />
        </div>
      </div>
    </section>
  );
}
