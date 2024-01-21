import React from "react";
import Link from "next/link";
import Image from "next/image";
import { Store } from "@/types";

type StoreCardProps = {
  store: Store;
};

const StoreCard = ({ store }: StoreCardProps) => {
  return (
    <div className="sm:w-1/2 mb-10 px-4 py-4 shadow-lg">
      <div className="rounded-lg overflow-hidden shadow-md">
        <img
          alt="content"
          className="object-center object-contain "
          src={store.image_url}
        />
      </div>
      <h2 className="title-font text-2xl font-medium text-gray-900 mt-6 mb-3">
        {store.name}
      </h2>
      <p className="leading-relaxed text-sm pb-4 text-gray-900">{`住所: ${store.address}`}</p>
      <p className="leading-relaxed text-sm">{store.content}</p>
      <Link
        href={store.official_link}
        className="inline-block mx-auto mt-6 text-white bg-blue-500 border-0 py-2 px-5 focus:outline-none hover:bg-blue-600 rounded"
      >
        公式サイト
      </Link>
    </div>
  );
};

export default StoreCard;
