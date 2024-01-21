import Image from "next/image";
import Link from "next/link";
import React from "react";
import StoreCard from "./StoreCard";
import { Store } from "@/types";

type StoreListProps = {
  stores: Store[];
};

const StoreList = ({ stores }: StoreListProps) => {

  return (
    <>
      {stores?.map((store) => (
        <StoreCard store={store} key={store.id} />
      ))}
    </>
  );
};

export default StoreList;
