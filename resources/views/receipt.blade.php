<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            font-size: 13px;
            /* slightly larger than 12px */
        }

        .receipt {
            width: 190mm;
            margin: 10px auto;
            padding: 9px;
            /* medium padding */
            border: 1px solid #ffffff;
        }

        h1 {
            font-size: 1.3em;
            /* between 1.2 and 1.5 */
            text-align: center;
            margin-bottom: 5px;
        }

        h2 {
            font-size: 1.05em;
            /* slightly larger */
            text-align: left;
            margin-bottom: 2px;
        }

        p {
            font-size: 0.95em;
            /* slightly larger than 0.9 */
            margin: 2px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.9em;
            /* between 0.85 and 1 */
        }

        th,
        td {
            border: 1px solid #eee;
            padding: 5px;
            /* medium padding */
            text-align: left;
        }

        th {
            background-color: #ffffff;
        }

        .total {
            font-weight: bold;
            text-align: right;
            font-size: 1em;
            /* slightly bigger than 0.95 */
        }

        .signature-container {
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
            /* medium spacing */
            width: 100%;
            gap: 15px;
        }

        .signature-section {
            width: 45%;
            text-align: center;
        }

        .signature_buy,
        .signature_sell {
            margin-top: 20px;
            margin-bottom: 40px;
        }

        .receipt-details-table {
            font-size: 0.8em;
            /* medium size for table */
        }

        .receipt-details {
            font-size: 0.8em;
            font-style: italic;
            margin-top: 5px;
        }

        @media print {
            .receipt {
                width: 80mm;
                margin: 0;
                padding: 5px;
                border: none;
            }

            body {
                font-size: 11px;
                /* medium print size */
            }
        }
    </style>



</head>

<body onload="window.print()">
    <div class="receipt">
        <div style="text-align: center;">
            <h1 text-align: center;>Invoice</h1>
        </div>
        <div style="display: flex; align-items: center; justify-content: space-between;">
            <img src="{{ public_path('storage\default\bg.png') }}" alt="Logo" width="70" align="right">
            <h2 style="margin: 0;">TL Gold Computer</h2>
        </div>

        <table class="receipt-details", style="width: 70%; margin-top: 20px; border-collapse: collapse; border: none;">
            <tr>
                <td
                    style="text-align: left; width: 50%; border: none; padding: 0;margin-left: 30px;  vertical-align: top;">
                    <p>Sell to:{{ $sale->customer->name }}</p>
                    <p>Phone: {{ $sale->customer->phone ?? 'N/A' }}</p>
                    <p>Address: {{ $sale->customer->address ?? 'N/A' }} </p>
                </td>
                <td
                    style="text-align: left; width: 50%; border: none; padding: 0;margin-left: 90px;  vertical-align: top;">
                    <p>Invoice No: 00{{ $sale->id }}</p>
                    <p>Invoice Date: {{ \Carbon\Carbon::parse($sale->sale_date)->format('F d, Y') }}</p>

                </td>
            </tr>
        </table>
        <table border="1" cellspacing="0" cellpadding="6" width="100%">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th style="white-space: nowrap;">Unit Price</th>
                    <th>Discount</th>
                    <th style="white-space: nowrap;">Sub Total</th>
                </tr>
            </thead>
            <tbody class="receipt-details-table">
                @php $subTotal = 0; @endphp
                @foreach ($sale->items ?? [] as $item)
                    @php
                        $discount = $item->discount ?? 0; // percentage
                        $amount = $item->qty * $item->unit_price * (1 - $discount / 100);
                        $subTotal += $amount;
                    @endphp
                    <tr>
                        <td>{{ $item->product->name }}</td>
                        <td style="min-height:50px;  overflow:hidden;">
                            {{ \Illuminate\Support\Str::limit(strip_tags($item->product->description ?? '-'), 200, '...') }}
                        </td>

                        <td>{{ $item->qty }}</td>
                        <td>${{ number_format($item->unit_price, 2) }}</td>
                        <td>{{ number_format($item->qty > 0 ? $item->discount / $item->qty : 0) }}%</td>
                        <td>${{ number_format($item->subTotal() - $item->discount_amount, 2) }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
        <br>
        {{-- <p class="total">Total Discount:.......................${{ number_format($sale->discount_amount ?? 0, 2) }}
        </p> --}}

        <p class="total">Total Amount:.....................${{ number_format($subTotal - $sale->discount_amount, 2) }}
            {{-- / (R) {{ number_format(($subTotal - $sale->discount_amount) * 4000, 0) }} --}}
        </p>
        <p class="total">Paid Amount:.....................${{ number_format($sale->total_pay, 2) }}
            {{-- (R) {{ number_format($sale->total_pay * 4000, 0) --}}
        </p>
        <p class="total">________________</p>
        <div class = "receipt-details">
            <p> <strong>Term of Conditions: </strong><br>
                1.Customers must thoroughly check the products before taking them out of the store.
                Our store is not responsible for any damages, breakages, or missing parts once the products have left
                our premises.<br>
                2.All purchased products cannot be refunded or exchanged.<br>
                3.For laptops, desktops, and other products, the company is not responsible for damages caused by fire,
                water exposure, missing warranty seals, physical damage, or deformation of the original product.<br>
                4.Certain parts are not covered by warranty, such as power supplies, adapters, batteries, speakers, dead
                pixels, or vertical screen lines.<br>
                5.The warranty does not apply if the customer irons or tapes over the product in a way that clearly
                causes
                issues.
            </p>
        </div>

        <div style="display: flex; justify-content: space-between; margin-top: 50px; width: 100%;">
            <!-- Customer Signature -->
            <div style="width: 49%; text-align: center; display: inline-block;">
                <p style="margin-bottom: 10px;">Customer Signature</p>
                <div
                    style="
            border: 1px solid #000;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: center;
        ">
                    <span style="color: #aaa;"></span>
                </div>
            </div>

            <!-- Seller Signature -->
            <div style="width: 49%; text-align: center; display: inline-block;">
                <p style="margin-bottom: 10px;">Seller Signature</p>
                <div
                    style="
            border: 1px solid #000;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: center;
        ">
                    <span style="color: #aaa;"></span>
                </div>
            </div>
        </div>

    </div>
</body>

</html>
