PGDMP  7    
    
            |            HMS    16.3 (Postgres.app)    16.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16390    HMS    DATABASE     q   CREATE DATABASE "HMS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE "HMS";
                waseemmosam    false            �            1259    16391    Bookings    TABLE       CREATE TABLE public."Bookings" (
    "booking_Date" date,
    "checkIn_date" date,
    "checkOut_date" date,
    "Status" character varying,
    "Booking_ID" integer NOT NULL,
    "Room_ID" integer,
    "Guest_ID" integer,
    "Invoice_ID" bigint,
    "Payment_ID" bigint
);
    DROP TABLE public."Bookings";
       public         heap    postgres    false            �            1259    16396    Bookings_Booking_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Bookings_Booking_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Bookings_Booking_ID_seq";
       public          postgres    false    215            �           0    0    Bookings_Booking_ID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Bookings_Booking_ID_seq" OWNED BY public."Bookings"."Booking_ID";
          public          postgres    false    216            �            1259    16397    Bookings_GuestID_seq    SEQUENCE     �   CREATE SEQUENCE public."Bookings_GuestID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Bookings_GuestID_seq";
       public          postgres    false    215            �           0    0    Bookings_GuestID_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public."Bookings_GuestID_seq" OWNED BY public."Bookings"."Guest_ID";
          public          postgres    false    217            �            1259    16398    Bookings_Invoice_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Bookings_Invoice_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Bookings_Invoice_ID_seq";
       public          postgres    false    215            �           0    0    Bookings_Invoice_ID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Bookings_Invoice_ID_seq" OWNED BY public."Bookings"."Invoice_ID";
          public          postgres    false    218            �            1259    16399    Bookings_Payment_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Bookings_Payment_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Bookings_Payment_ID_seq";
       public          postgres    false    215            �           0    0    Bookings_Payment_ID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Bookings_Payment_ID_seq" OWNED BY public."Bookings"."Payment_ID";
          public          postgres    false    219            �            1259    16400    Bookings_Room_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Bookings_Room_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Bookings_Room_ID_seq";
       public          postgres    false    215            �           0    0    Bookings_Room_ID_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Bookings_Room_ID_seq" OWNED BY public."Bookings"."Room_ID";
          public          postgres    false    220            �            1259    16401    Feedback    TABLE     �   CREATE TABLE public."Feedback" (
    "Feedback_ID" integer NOT NULL,
    "Comment" character varying,
    "Guest_ID" bigint,
    "Hotel_ID" bigint
);
    DROP TABLE public."Feedback";
       public         heap    postgres    false            �            1259    16406    Feedback_Feedback_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Feedback_Feedback_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Feedback_Feedback_ID_seq";
       public          postgres    false    221            �           0    0    Feedback_Feedback_ID_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Feedback_Feedback_ID_seq" OWNED BY public."Feedback"."Feedback_ID";
          public          postgres    false    222            �            1259    16407    Feedback_Guest_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Feedback_Guest_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Feedback_Guest_ID_seq";
       public          postgres    false    221            �           0    0    Feedback_Guest_ID_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Feedback_Guest_ID_seq" OWNED BY public."Feedback"."Guest_ID";
          public          postgres    false    223            �            1259    16408    Feedback_Hotel_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Feedback_Hotel_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Feedback_Hotel_ID_seq";
       public          postgres    false    221            �           0    0    Feedback_Hotel_ID_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Feedback_Hotel_ID_seq" OWNED BY public."Feedback"."Hotel_ID";
          public          postgres    false    224            �            1259    16409    Guest    TABLE     �   CREATE TABLE public."Guest" (
    "Guest_ID" integer NOT NULL,
    "Full_Names" character varying,
    "Contact" integer,
    email character varying,
    "Hotel_ID" integer
);
    DROP TABLE public."Guest";
       public         heap    postgres    false            �            1259    16414    Guest_Guest_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Guest_Guest_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Guest_Guest_ID_seq";
       public          postgres    false    225            �           0    0    Guest_Guest_ID_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Guest_Guest_ID_seq" OWNED BY public."Guest"."Guest_ID";
          public          postgres    false    226            �            1259    16415    Guest_Hotel_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Guest_Hotel_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Guest_Hotel_ID_seq";
       public          postgres    false    225            �           0    0    Guest_Hotel_ID_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Guest_Hotel_ID_seq" OWNED BY public."Guest"."Hotel_ID";
          public          postgres    false    227            �            1259    16416    Hotel    TABLE     �   CREATE TABLE public."Hotel" (
    "Hotel_ID" integer NOT NULL,
    "Name" character varying,
    "Location" character varying,
    "Rating" integer,
    "Contact_Number" integer,
    "Image" json
);
    DROP TABLE public."Hotel";
       public         heap    postgres    false            �            1259    16421    Hotel_Hotel_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Hotel_Hotel_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Hotel_Hotel_ID_seq";
       public          postgres    false    228            �           0    0    Hotel_Hotel_ID_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Hotel_Hotel_ID_seq" OWNED BY public."Hotel"."Hotel_ID";
          public          postgres    false    229            �            1259    16422    Invoices    TABLE     �   CREATE TABLE public."Invoices" (
    "Invoice_ID" integer NOT NULL,
    "Invoice_Date" date,
    "Amount" integer,
    "Booking_ID" integer
);
    DROP TABLE public."Invoices";
       public         heap    postgres    false            �            1259    16425    Invoices_Booking_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Invoices_Booking_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Invoices_Booking_ID_seq";
       public          postgres    false    230            �           0    0    Invoices_Booking_ID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Invoices_Booking_ID_seq" OWNED BY public."Invoices"."Booking_ID";
          public          postgres    false    231            �            1259    16426    Invoices_Invoice_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Invoices_Invoice_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Invoices_Invoice_ID_seq";
       public          postgres    false    230            �           0    0    Invoices_Invoice_ID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Invoices_Invoice_ID_seq" OWNED BY public."Invoices"."Invoice_ID";
          public          postgres    false    232            �            1259    16427    Payment    TABLE     �   CREATE TABLE public."Payment" (
    "Payment_ID" integer NOT NULL,
    "Payment_Date" date,
    "Payment_method" character varying,
    "Booking_ID" integer,
    "Guest_ID" integer,
    "Receipt_ID" integer
);
    DROP TABLE public."Payment";
       public         heap    postgres    false            �            1259    16432    Payment_Booking_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Payment_Booking_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Payment_Booking_ID_seq";
       public          postgres    false    233            �           0    0    Payment_Booking_ID_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Payment_Booking_ID_seq" OWNED BY public."Payment"."Booking_ID";
          public          postgres    false    234            �            1259    16433    Payment_Guest_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Payment_Guest_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Payment_Guest_ID_seq";
       public          postgres    false    233            �           0    0    Payment_Guest_ID_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Payment_Guest_ID_seq" OWNED BY public."Payment"."Guest_ID";
          public          postgres    false    235            �            1259    16434    Payment_Payment_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Payment_Payment_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Payment_Payment_ID_seq";
       public          postgres    false    233            �           0    0    Payment_Payment_ID_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Payment_Payment_ID_seq" OWNED BY public."Payment"."Payment_ID";
          public          postgres    false    236            �            1259    16435    Payment_Receipt_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Payment_Receipt_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Payment_Receipt_ID_seq";
       public          postgres    false    233            �           0    0    Payment_Receipt_ID_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Payment_Receipt_ID_seq" OWNED BY public."Payment"."Receipt_ID";
          public          postgres    false    237            �            1259    16436    Receipts    TABLE     �   CREATE TABLE public."Receipts" (
    "Receipt_ID" integer NOT NULL,
    "Amount" integer,
    "Method_Of_Payment" character varying,
    "Report_ID" integer,
    "Payment_ID" integer,
    "Guest_ID" integer
);
    DROP TABLE public."Receipts";
       public         heap    postgres    false            �            1259    16441    Receipts_Guest_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Receipts_Guest_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Receipts_Guest_ID_seq";
       public          postgres    false    238            �           0    0    Receipts_Guest_ID_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Receipts_Guest_ID_seq" OWNED BY public."Receipts"."Guest_ID";
          public          postgres    false    239            �            1259    16442    Receipts_Payment_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Receipts_Payment_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Receipts_Payment_ID_seq";
       public          postgres    false    238            �           0    0    Receipts_Payment_ID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Receipts_Payment_ID_seq" OWNED BY public."Receipts"."Payment_ID";
          public          postgres    false    240            �            1259    16443    Receipts_Receipt_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Receipts_Receipt_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public."Receipts_Receipt_ID_seq";
       public          postgres    false    238            �           0    0    Receipts_Receipt_ID_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Receipts_Receipt_ID_seq" OWNED BY public."Receipts"."Receipt_ID";
          public          postgres    false    241            �            1259    16444    Receipts_Report_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Receipts_Report_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Receipts_Report_ID_seq";
       public          postgres    false    238            �           0    0    Receipts_Report_ID_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Receipts_Report_ID_seq" OWNED BY public."Receipts"."Report_ID";
          public          postgres    false    242            �            1259    16445    Report    TABLE     �   CREATE TABLE public."Report" (
    "Report_ID" integer NOT NULL,
    "Report_Date" date,
    "Description" character varying,
    "Staff_ID" bigint
);
    DROP TABLE public."Report";
       public         heap    postgres    false            �            1259    16450    Report_Report_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Report_Report_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Report_Report_ID_seq";
       public          postgres    false    243            �           0    0    Report_Report_ID_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Report_Report_ID_seq" OWNED BY public."Report"."Report_ID";
          public          postgres    false    244            �            1259    16451    Report_Staff_ID_seq    SEQUENCE     ~   CREATE SEQUENCE public."Report_Staff_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Report_Staff_ID_seq";
       public          postgres    false    243            �           0    0    Report_Staff_ID_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Report_Staff_ID_seq" OWNED BY public."Report"."Staff_ID";
          public          postgres    false    245            �            1259    16452    Room    TABLE     �   CREATE TABLE public."Room" (
    "Room_ID" integer NOT NULL,
    "Room_Number" integer,
    "Hotel_ID" integer,
    "RoomType_ID" bigint,
    "Status" boolean
);
    DROP TABLE public."Room";
       public         heap    postgres    false            �            1259    16455    Room_Hotel_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Room_Hotel_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Room_Hotel_ID_seq";
       public          postgres    false    246            �           0    0    Room_Hotel_ID_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Room_Hotel_ID_seq" OWNED BY public."Room"."Hotel_ID";
          public          postgres    false    247            �            1259    16456    Room_Room_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Room_Room_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."Room_Room_ID_seq";
       public          postgres    false    246            �           0    0    Room_Room_ID_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."Room_Room_ID_seq" OWNED BY public."Room"."Room_ID";
          public          postgres    false    248            �            1259    16457 	   Room_Type    TABLE     ?  CREATE TABLE public."Room_Type" (
    "RoomType_ID" bigint NOT NULL,
    "Description1" character varying,
    "Price" integer,
    "NumberOfGuests" integer,
    "Bedrooms" integer,
    "Bathrooms" integer,
    "Image1" json,
    "Image2" json,
    "RoomName" character varying,
    "Description2" character varying
);
    DROP TABLE public."Room_Type";
       public         heap    postgres    false            �            1259    16462    Room_Type_RoomType_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Room_Type_RoomType_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public."Room_Type_RoomType_ID_seq";
       public          postgres    false    249            �           0    0    Room_Type_RoomType_ID_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Room_Type_RoomType_ID_seq" OWNED BY public."Room_Type"."RoomType_ID";
          public          postgres    false    250            �            1259    16463    Staff    TABLE     �   CREATE TABLE public."Staff" (
    "Staff_ID" integer NOT NULL,
    "FullName" character varying,
    "Position" character varying,
    "Contact_Number" integer,
    "Hotel_ID" integer
);
    DROP TABLE public."Staff";
       public         heap    postgres    false            �            1259    16468    Staff_Hotel_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Staff_Hotel_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Staff_Hotel_ID_seq";
       public          postgres    false    251            �           0    0    Staff_Hotel_ID_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Staff_Hotel_ID_seq" OWNED BY public."Staff"."Hotel_ID";
          public          postgres    false    252            �            1259    16469    Staff_Staff_ID_seq    SEQUENCE     �   CREATE SEQUENCE public."Staff_Staff_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Staff_Staff_ID_seq";
       public          postgres    false    251            �           0    0    Staff_Staff_ID_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Staff_Staff_ID_seq" OWNED BY public."Staff"."Staff_ID";
          public          postgres    false    253            �           2604    16470    Bookings Booking_ID    DEFAULT     �   ALTER TABLE ONLY public."Bookings" ALTER COLUMN "Booking_ID" SET DEFAULT nextval('public."Bookings_Booking_ID_seq"'::regclass);
 F   ALTER TABLE public."Bookings" ALTER COLUMN "Booking_ID" DROP DEFAULT;
       public          postgres    false    216    215            �           2604    16471    Bookings Room_ID    DEFAULT     z   ALTER TABLE ONLY public."Bookings" ALTER COLUMN "Room_ID" SET DEFAULT nextval('public."Bookings_Room_ID_seq"'::regclass);
 C   ALTER TABLE public."Bookings" ALTER COLUMN "Room_ID" DROP DEFAULT;
       public          postgres    false    220    215            �           2604    16472    Bookings Guest_ID    DEFAULT     {   ALTER TABLE ONLY public."Bookings" ALTER COLUMN "Guest_ID" SET DEFAULT nextval('public."Bookings_GuestID_seq"'::regclass);
 D   ALTER TABLE public."Bookings" ALTER COLUMN "Guest_ID" DROP DEFAULT;
       public          postgres    false    217    215            �           2604    16473    Bookings Invoice_ID    DEFAULT     �   ALTER TABLE ONLY public."Bookings" ALTER COLUMN "Invoice_ID" SET DEFAULT nextval('public."Bookings_Invoice_ID_seq"'::regclass);
 F   ALTER TABLE public."Bookings" ALTER COLUMN "Invoice_ID" DROP DEFAULT;
       public          postgres    false    218    215            �           2604    16474    Bookings Payment_ID    DEFAULT     �   ALTER TABLE ONLY public."Bookings" ALTER COLUMN "Payment_ID" SET DEFAULT nextval('public."Bookings_Payment_ID_seq"'::regclass);
 F   ALTER TABLE public."Bookings" ALTER COLUMN "Payment_ID" DROP DEFAULT;
       public          postgres    false    219    215            �           2604    16475    Feedback Feedback_ID    DEFAULT     �   ALTER TABLE ONLY public."Feedback" ALTER COLUMN "Feedback_ID" SET DEFAULT nextval('public."Feedback_Feedback_ID_seq"'::regclass);
 G   ALTER TABLE public."Feedback" ALTER COLUMN "Feedback_ID" DROP DEFAULT;
       public          postgres    false    222    221            �           2604    16476    Feedback Guest_ID    DEFAULT     |   ALTER TABLE ONLY public."Feedback" ALTER COLUMN "Guest_ID" SET DEFAULT nextval('public."Feedback_Guest_ID_seq"'::regclass);
 D   ALTER TABLE public."Feedback" ALTER COLUMN "Guest_ID" DROP DEFAULT;
       public          postgres    false    223    221            �           2604    16477    Feedback Hotel_ID    DEFAULT     |   ALTER TABLE ONLY public."Feedback" ALTER COLUMN "Hotel_ID" SET DEFAULT nextval('public."Feedback_Hotel_ID_seq"'::regclass);
 D   ALTER TABLE public."Feedback" ALTER COLUMN "Hotel_ID" DROP DEFAULT;
       public          postgres    false    224    221            �           2604    16478    Guest Guest_ID    DEFAULT     v   ALTER TABLE ONLY public."Guest" ALTER COLUMN "Guest_ID" SET DEFAULT nextval('public."Guest_Guest_ID_seq"'::regclass);
 A   ALTER TABLE public."Guest" ALTER COLUMN "Guest_ID" DROP DEFAULT;
       public          postgres    false    226    225            �           2604    16479    Guest Hotel_ID    DEFAULT     v   ALTER TABLE ONLY public."Guest" ALTER COLUMN "Hotel_ID" SET DEFAULT nextval('public."Guest_Hotel_ID_seq"'::regclass);
 A   ALTER TABLE public."Guest" ALTER COLUMN "Hotel_ID" DROP DEFAULT;
       public          postgres    false    227    225            �           2604    16480    Hotel Hotel_ID    DEFAULT     v   ALTER TABLE ONLY public."Hotel" ALTER COLUMN "Hotel_ID" SET DEFAULT nextval('public."Hotel_Hotel_ID_seq"'::regclass);
 A   ALTER TABLE public."Hotel" ALTER COLUMN "Hotel_ID" DROP DEFAULT;
       public          postgres    false    229    228            �           2604    16481    Invoices Invoice_ID    DEFAULT     �   ALTER TABLE ONLY public."Invoices" ALTER COLUMN "Invoice_ID" SET DEFAULT nextval('public."Invoices_Invoice_ID_seq"'::regclass);
 F   ALTER TABLE public."Invoices" ALTER COLUMN "Invoice_ID" DROP DEFAULT;
       public          postgres    false    232    230            �           2604    16482    Invoices Booking_ID    DEFAULT     �   ALTER TABLE ONLY public."Invoices" ALTER COLUMN "Booking_ID" SET DEFAULT nextval('public."Invoices_Booking_ID_seq"'::regclass);
 F   ALTER TABLE public."Invoices" ALTER COLUMN "Booking_ID" DROP DEFAULT;
       public          postgres    false    231    230            �           2604    16483    Payment Payment_ID    DEFAULT     ~   ALTER TABLE ONLY public."Payment" ALTER COLUMN "Payment_ID" SET DEFAULT nextval('public."Payment_Payment_ID_seq"'::regclass);
 E   ALTER TABLE public."Payment" ALTER COLUMN "Payment_ID" DROP DEFAULT;
       public          postgres    false    236    233            �           2604    16484    Payment Booking_ID    DEFAULT     ~   ALTER TABLE ONLY public."Payment" ALTER COLUMN "Booking_ID" SET DEFAULT nextval('public."Payment_Booking_ID_seq"'::regclass);
 E   ALTER TABLE public."Payment" ALTER COLUMN "Booking_ID" DROP DEFAULT;
       public          postgres    false    234    233            �           2604    16485    Payment Guest_ID    DEFAULT     z   ALTER TABLE ONLY public."Payment" ALTER COLUMN "Guest_ID" SET DEFAULT nextval('public."Payment_Guest_ID_seq"'::regclass);
 C   ALTER TABLE public."Payment" ALTER COLUMN "Guest_ID" DROP DEFAULT;
       public          postgres    false    235    233            �           2604    16486    Payment Receipt_ID    DEFAULT     ~   ALTER TABLE ONLY public."Payment" ALTER COLUMN "Receipt_ID" SET DEFAULT nextval('public."Payment_Receipt_ID_seq"'::regclass);
 E   ALTER TABLE public."Payment" ALTER COLUMN "Receipt_ID" DROP DEFAULT;
       public          postgres    false    237    233            �           2604    16487    Receipts Receipt_ID    DEFAULT     �   ALTER TABLE ONLY public."Receipts" ALTER COLUMN "Receipt_ID" SET DEFAULT nextval('public."Receipts_Receipt_ID_seq"'::regclass);
 F   ALTER TABLE public."Receipts" ALTER COLUMN "Receipt_ID" DROP DEFAULT;
       public          postgres    false    241    238            �           2604    16488    Receipts Report_ID    DEFAULT     ~   ALTER TABLE ONLY public."Receipts" ALTER COLUMN "Report_ID" SET DEFAULT nextval('public."Receipts_Report_ID_seq"'::regclass);
 E   ALTER TABLE public."Receipts" ALTER COLUMN "Report_ID" DROP DEFAULT;
       public          postgres    false    242    238            �           2604    16489    Receipts Payment_ID    DEFAULT     �   ALTER TABLE ONLY public."Receipts" ALTER COLUMN "Payment_ID" SET DEFAULT nextval('public."Receipts_Payment_ID_seq"'::regclass);
 F   ALTER TABLE public."Receipts" ALTER COLUMN "Payment_ID" DROP DEFAULT;
       public          postgres    false    240    238            �           2604    16490    Receipts Guest_ID    DEFAULT     |   ALTER TABLE ONLY public."Receipts" ALTER COLUMN "Guest_ID" SET DEFAULT nextval('public."Receipts_Guest_ID_seq"'::regclass);
 D   ALTER TABLE public."Receipts" ALTER COLUMN "Guest_ID" DROP DEFAULT;
       public          postgres    false    239    238            �           2604    16491    Report Report_ID    DEFAULT     z   ALTER TABLE ONLY public."Report" ALTER COLUMN "Report_ID" SET DEFAULT nextval('public."Report_Report_ID_seq"'::regclass);
 C   ALTER TABLE public."Report" ALTER COLUMN "Report_ID" DROP DEFAULT;
       public          postgres    false    244    243            �           2604    16492    Report Staff_ID    DEFAULT     x   ALTER TABLE ONLY public."Report" ALTER COLUMN "Staff_ID" SET DEFAULT nextval('public."Report_Staff_ID_seq"'::regclass);
 B   ALTER TABLE public."Report" ALTER COLUMN "Staff_ID" DROP DEFAULT;
       public          postgres    false    245    243            �           2604    16493    Room Room_ID    DEFAULT     r   ALTER TABLE ONLY public."Room" ALTER COLUMN "Room_ID" SET DEFAULT nextval('public."Room_Room_ID_seq"'::regclass);
 ?   ALTER TABLE public."Room" ALTER COLUMN "Room_ID" DROP DEFAULT;
       public          postgres    false    248    246            �           2604    16494    Room Hotel_ID    DEFAULT     t   ALTER TABLE ONLY public."Room" ALTER COLUMN "Hotel_ID" SET DEFAULT nextval('public."Room_Hotel_ID_seq"'::regclass);
 @   ALTER TABLE public."Room" ALTER COLUMN "Hotel_ID" DROP DEFAULT;
       public          postgres    false    247    246            �           2604    16495    Room_Type RoomType_ID    DEFAULT     �   ALTER TABLE ONLY public."Room_Type" ALTER COLUMN "RoomType_ID" SET DEFAULT nextval('public."Room_Type_RoomType_ID_seq"'::regclass);
 H   ALTER TABLE public."Room_Type" ALTER COLUMN "RoomType_ID" DROP DEFAULT;
       public          postgres    false    250    249            �           2604    16496    Staff Staff_ID    DEFAULT     v   ALTER TABLE ONLY public."Staff" ALTER COLUMN "Staff_ID" SET DEFAULT nextval('public."Staff_Staff_ID_seq"'::regclass);
 A   ALTER TABLE public."Staff" ALTER COLUMN "Staff_ID" DROP DEFAULT;
       public          postgres    false    253    251            �           2604    16497    Staff Hotel_ID    DEFAULT     v   ALTER TABLE ONLY public."Staff" ALTER COLUMN "Hotel_ID" SET DEFAULT nextval('public."Staff_Hotel_ID_seq"'::regclass);
 A   ALTER TABLE public."Staff" ALTER COLUMN "Hotel_ID" DROP DEFAULT;
       public          postgres    false    252    251            �          0    16391    Bookings 
   TABLE DATA           �   COPY public."Bookings" ("booking_Date", "checkIn_date", "checkOut_date", "Status", "Booking_ID", "Room_ID", "Guest_ID", "Invoice_ID", "Payment_ID") FROM stdin;
    public          postgres    false    215   _�       �          0    16401    Feedback 
   TABLE DATA           V   COPY public."Feedback" ("Feedback_ID", "Comment", "Guest_ID", "Hotel_ID") FROM stdin;
    public          postgres    false    221   |�       �          0    16409    Guest 
   TABLE DATA           Y   COPY public."Guest" ("Guest_ID", "Full_Names", "Contact", email, "Hotel_ID") FROM stdin;
    public          postgres    false    225   ��       �          0    16416    Hotel 
   TABLE DATA           f   COPY public."Hotel" ("Hotel_ID", "Name", "Location", "Rating", "Contact_Number", "Image") FROM stdin;
    public          postgres    false    228   ��       �          0    16422    Invoices 
   TABLE DATA           Z   COPY public."Invoices" ("Invoice_ID", "Invoice_Date", "Amount", "Booking_ID") FROM stdin;
    public          postgres    false    230   G�       �          0    16427    Payment 
   TABLE DATA           {   COPY public."Payment" ("Payment_ID", "Payment_Date", "Payment_method", "Booking_ID", "Guest_ID", "Receipt_ID") FROM stdin;
    public          postgres    false    233   d�       �          0    16436    Receipts 
   TABLE DATA           x   COPY public."Receipts" ("Receipt_ID", "Amount", "Method_Of_Payment", "Report_ID", "Payment_ID", "Guest_ID") FROM stdin;
    public          postgres    false    238   ��       �          0    16445    Report 
   TABLE DATA           Y   COPY public."Report" ("Report_ID", "Report_Date", "Description", "Staff_ID") FROM stdin;
    public          postgres    false    243   ��       �          0    16452    Room 
   TABLE DATA           _   COPY public."Room" ("Room_ID", "Room_Number", "Hotel_ID", "RoomType_ID", "Status") FROM stdin;
    public          postgres    false    246   ��       �          0    16457 	   Room_Type 
   TABLE DATA           �   COPY public."Room_Type" ("RoomType_ID", "Description1", "Price", "NumberOfGuests", "Bedrooms", "Bathrooms", "Image1", "Image2", "RoomName", "Description2") FROM stdin;
    public          postgres    false    249   ��       �          0    16463    Staff 
   TABLE DATA           c   COPY public."Staff" ("Staff_ID", "FullName", "Position", "Contact_Number", "Hotel_ID") FROM stdin;
    public          postgres    false    251   �       �           0    0    Bookings_Booking_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Bookings_Booking_ID_seq"', 1, false);
          public          postgres    false    216            �           0    0    Bookings_GuestID_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Bookings_GuestID_seq"', 1, false);
          public          postgres    false    217            �           0    0    Bookings_Invoice_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Bookings_Invoice_ID_seq"', 1, false);
          public          postgres    false    218            �           0    0    Bookings_Payment_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Bookings_Payment_ID_seq"', 1, false);
          public          postgres    false    219            �           0    0    Bookings_Room_ID_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Bookings_Room_ID_seq"', 1, false);
          public          postgres    false    220            �           0    0    Feedback_Feedback_ID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Feedback_Feedback_ID_seq"', 1, false);
          public          postgres    false    222            �           0    0    Feedback_Guest_ID_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Feedback_Guest_ID_seq"', 1, false);
          public          postgres    false    223            �           0    0    Feedback_Hotel_ID_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Feedback_Hotel_ID_seq"', 1, false);
          public          postgres    false    224            �           0    0    Guest_Guest_ID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Guest_Guest_ID_seq"', 1, false);
          public          postgres    false    226            �           0    0    Guest_Hotel_ID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Guest_Hotel_ID_seq"', 1, false);
          public          postgres    false    227            �           0    0    Hotel_Hotel_ID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Hotel_Hotel_ID_seq"', 2, true);
          public          postgres    false    229            �           0    0    Invoices_Booking_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Invoices_Booking_ID_seq"', 1, false);
          public          postgres    false    231            �           0    0    Invoices_Invoice_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Invoices_Invoice_ID_seq"', 1, false);
          public          postgres    false    232            �           0    0    Payment_Booking_ID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Payment_Booking_ID_seq"', 1, false);
          public          postgres    false    234            �           0    0    Payment_Guest_ID_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Payment_Guest_ID_seq"', 1, false);
          public          postgres    false    235            �           0    0    Payment_Payment_ID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Payment_Payment_ID_seq"', 1, false);
          public          postgres    false    236            �           0    0    Payment_Receipt_ID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Payment_Receipt_ID_seq"', 1, false);
          public          postgres    false    237            �           0    0    Receipts_Guest_ID_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Receipts_Guest_ID_seq"', 1, false);
          public          postgres    false    239            �           0    0    Receipts_Payment_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Receipts_Payment_ID_seq"', 1, false);
          public          postgres    false    240            �           0    0    Receipts_Receipt_ID_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public."Receipts_Receipt_ID_seq"', 1, false);
          public          postgres    false    241            �           0    0    Receipts_Report_ID_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Receipts_Report_ID_seq"', 1, false);
          public          postgres    false    242            �           0    0    Report_Report_ID_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Report_Report_ID_seq"', 1, false);
          public          postgres    false    244            �           0    0    Report_Staff_ID_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Report_Staff_ID_seq"', 1, false);
          public          postgres    false    245            �           0    0    Room_Hotel_ID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Room_Hotel_ID_seq"', 1, false);
          public          postgres    false    247                        0    0    Room_Room_ID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Room_Room_ID_seq"', 4, true);
          public          postgres    false    248                       0    0    Room_Type_RoomType_ID_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Room_Type_RoomType_ID_seq"', 3, true);
          public          postgres    false    250                       0    0    Staff_Hotel_ID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Staff_Hotel_ID_seq"', 1, false);
          public          postgres    false    252                       0    0    Staff_Staff_ID_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Staff_Staff_ID_seq"', 1, false);
          public          postgres    false    253            �           2606    16499    Bookings Bookings_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Bookings"
    ADD CONSTRAINT "Bookings_pkey" PRIMARY KEY ("Booking_ID");
 D   ALTER TABLE ONLY public."Bookings" DROP CONSTRAINT "Bookings_pkey";
       public            postgres    false    215            �           2606    16501    Feedback Feedback_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Feedback"
    ADD CONSTRAINT "Feedback_pkey" PRIMARY KEY ("Feedback_ID");
 D   ALTER TABLE ONLY public."Feedback" DROP CONSTRAINT "Feedback_pkey";
       public            postgres    false    221            �           2606    16503    Guest Guest_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Guest"
    ADD CONSTRAINT "Guest_pkey" PRIMARY KEY ("Guest_ID");
 >   ALTER TABLE ONLY public."Guest" DROP CONSTRAINT "Guest_pkey";
       public            postgres    false    225            �           2606    16505    Hotel Hotel_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Hotel"
    ADD CONSTRAINT "Hotel_pkey" PRIMARY KEY ("Hotel_ID");
 >   ALTER TABLE ONLY public."Hotel" DROP CONSTRAINT "Hotel_pkey";
       public            postgres    false    228            �           2606    16507    Invoices Invoices_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT "Invoices_pkey" PRIMARY KEY ("Invoice_ID");
 D   ALTER TABLE ONLY public."Invoices" DROP CONSTRAINT "Invoices_pkey";
       public            postgres    false    230            �           2606    16509    Payment Payment_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_pkey" PRIMARY KEY ("Payment_ID");
 B   ALTER TABLE ONLY public."Payment" DROP CONSTRAINT "Payment_pkey";
       public            postgres    false    233            �           2606    16511    Receipts Receipts_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Receipts"
    ADD CONSTRAINT "Receipts_pkey" PRIMARY KEY ("Receipt_ID");
 D   ALTER TABLE ONLY public."Receipts" DROP CONSTRAINT "Receipts_pkey";
       public            postgres    false    238            �           2606    16513    Report Report_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Report"
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY ("Report_ID");
 @   ALTER TABLE ONLY public."Report" DROP CONSTRAINT "Report_pkey";
       public            postgres    false    243            �           2606    16515    Room_Type Room_Type_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Room_Type"
    ADD CONSTRAINT "Room_Type_pkey" PRIMARY KEY ("RoomType_ID");
 F   ALTER TABLE ONLY public."Room_Type" DROP CONSTRAINT "Room_Type_pkey";
       public            postgres    false    249            �           2606    16517    Room Room_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT "Room_pkey" PRIMARY KEY ("Room_ID");
 <   ALTER TABLE ONLY public."Room" DROP CONSTRAINT "Room_pkey";
       public            postgres    false    246            �           2606    16519    Staff Staff_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_pkey" PRIMARY KEY ("Staff_ID");
 >   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "Staff_pkey";
       public            postgres    false    251                       2606    16520    Invoices FK_Booking_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Invoices"
    ADD CONSTRAINT "FK_Booking_ID" FOREIGN KEY ("Booking_ID") REFERENCES public."Bookings"("Booking_ID") NOT VALID;
 D   ALTER TABLE ONLY public."Invoices" DROP CONSTRAINT "FK_Booking_ID";
       public          postgres    false    3561    230    215                       2606    16525    Payment FK_Booking_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "FK_Booking_ID" FOREIGN KEY ("Booking_ID") REFERENCES public."Bookings"("Booking_ID") NOT VALID;
 C   ALTER TABLE ONLY public."Payment" DROP CONSTRAINT "FK_Booking_ID";
       public          postgres    false    233    3561    215            �           2606    16530    Bookings FK_Guest_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bookings"
    ADD CONSTRAINT "FK_Guest_ID" FOREIGN KEY ("Guest_ID") REFERENCES public."Guest"("Guest_ID") NOT VALID;
 B   ALTER TABLE ONLY public."Bookings" DROP CONSTRAINT "FK_Guest_ID";
       public          postgres    false    215    3565    225                       2606    16535    Payment FK_Guest_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "FK_Guest_ID" FOREIGN KEY ("Guest_ID") REFERENCES public."Guest"("Guest_ID") NOT VALID;
 A   ALTER TABLE ONLY public."Payment" DROP CONSTRAINT "FK_Guest_ID";
       public          postgres    false    225    3565    233            	           2606    16540    Receipts FK_Guest_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Receipts"
    ADD CONSTRAINT "FK_Guest_ID" FOREIGN KEY ("Guest_ID") REFERENCES public."Guest"("Guest_ID") NOT VALID;
 B   ALTER TABLE ONLY public."Receipts" DROP CONSTRAINT "FK_Guest_ID";
       public          postgres    false    3565    238    225                       2606    16545    Guest FK_Hotel_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Guest"
    ADD CONSTRAINT "FK_Hotel_ID" FOREIGN KEY ("Hotel_ID") REFERENCES public."Hotel"("Hotel_ID") NOT VALID;
 ?   ALTER TABLE ONLY public."Guest" DROP CONSTRAINT "FK_Hotel_ID";
       public          postgres    false    225    3567    228                       2606    16550    Room FK_Hotel_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT "FK_Hotel_ID" FOREIGN KEY ("Hotel_ID") REFERENCES public."Hotel"("Hotel_ID") NOT VALID;
 >   ALTER TABLE ONLY public."Room" DROP CONSTRAINT "FK_Hotel_ID";
       public          postgres    false    246    228    3567                       2606    16555    Staff FK_Hotel_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "FK_Hotel_ID" FOREIGN KEY ("Hotel_ID") REFERENCES public."Hotel"("Hotel_ID") NOT VALID;
 ?   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "FK_Hotel_ID";
       public          postgres    false    3567    228    251            �           2606    16560    Bookings FK_Invoice_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bookings"
    ADD CONSTRAINT "FK_Invoice_ID" FOREIGN KEY ("Invoice_ID") REFERENCES public."Invoices"("Invoice_ID") NOT VALID;
 D   ALTER TABLE ONLY public."Bookings" DROP CONSTRAINT "FK_Invoice_ID";
       public          postgres    false    215    3569    230            
           2606    16565    Receipts FK_Payment_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Receipts"
    ADD CONSTRAINT "FK_Payment_ID" FOREIGN KEY ("Payment_ID") REFERENCES public."Payment"("Payment_ID") NOT VALID;
 D   ALTER TABLE ONLY public."Receipts" DROP CONSTRAINT "FK_Payment_ID";
       public          postgres    false    233    238    3571                       2606    16570    Receipts FK_Report_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Receipts"
    ADD CONSTRAINT "FK_Report_ID" FOREIGN KEY ("Report_ID") REFERENCES public."Report"("Report_ID") NOT VALID;
 C   ALTER TABLE ONLY public."Receipts" DROP CONSTRAINT "FK_Report_ID";
       public          postgres    false    243    3575    238                       2606    16575    Room FK_RoomType_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Room"
    ADD CONSTRAINT "FK_RoomType_ID" FOREIGN KEY ("RoomType_ID") REFERENCES public."Room_Type"("RoomType_ID") NOT VALID;
 A   ALTER TABLE ONLY public."Room" DROP CONSTRAINT "FK_RoomType_ID";
       public          postgres    false    249    3579    246                        2606    16580    Bookings FK_Room_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bookings"
    ADD CONSTRAINT "FK_Room_ID" FOREIGN KEY ("Room_ID") REFERENCES public."Room"("Room_ID") NOT VALID;
 A   ALTER TABLE ONLY public."Bookings" DROP CONSTRAINT "FK_Room_ID";
       public          postgres    false    3577    215    246                       2606    16585    Feedback Guest_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Feedback"
    ADD CONSTRAINT "Guest_ID" FOREIGN KEY ("Guest_ID") REFERENCES public."Guest"("Guest_ID") NOT VALID;
 ?   ALTER TABLE ONLY public."Feedback" DROP CONSTRAINT "Guest_ID";
       public          postgres    false    3565    221    225                       2606    16590    Feedback Hotel_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Feedback"
    ADD CONSTRAINT "Hotel_ID" FOREIGN KEY ("Hotel_ID") REFERENCES public."Hotel"("Hotel_ID") NOT VALID;
 ?   ALTER TABLE ONLY public."Feedback" DROP CONSTRAINT "Hotel_ID";
       public          postgres    false    228    3567    221                       2606    16595    Bookings Payment_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bookings"
    ADD CONSTRAINT "Payment_ID" FOREIGN KEY ("Payment_ID") REFERENCES public."Payment"("Payment_ID") NOT VALID;
 A   ALTER TABLE ONLY public."Bookings" DROP CONSTRAINT "Payment_ID";
       public          postgres    false    233    215    3571                       2606    16600    Payment Receipt_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Receipt_ID" FOREIGN KEY ("Receipt_ID") REFERENCES public."Receipts"("Receipt_ID") NOT VALID;
 @   ALTER TABLE ONLY public."Payment" DROP CONSTRAINT "Receipt_ID";
       public          postgres    false    3573    233    238                       2606    16605    Report Staff_ID    FK CONSTRAINT     �   ALTER TABLE ONLY public."Report"
    ADD CONSTRAINT "Staff_ID" FOREIGN KEY ("Staff_ID") REFERENCES public."Staff"("Staff_ID") NOT VALID;
 =   ALTER TABLE ONLY public."Report" DROP CONSTRAINT "Staff_ID";
       public          postgres    false    243    251    3581            �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�3��NL�I�NL�tOL�/��K�44�426�4�4�V��SPP*.JV�RP���/I����MLO�+�KWҁH'攀�=@�
� Y%�D-�gPbJfqq~�X�ӭ(1/9��$�<�ӂ�̀�B[b���� +�:�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   %   x�3�42�4�.cN#0,�2�42
�1z\\\ d�J      �     x�Ց=O�0���WX��ҏcaD܀ 1uI���G�&GO����"��ndO~�W�^Wl
�J�%���`[VQ�Ac��;~	��E�3ge�{�Y��!�����=rB�?�EN�����=uV��8Gd����������!QeD@P��(L�yv>������6�=)|�Ǩ���Z���"7zuHj�Н��V/�|�G�Ee{8(�ܴ�	˨���Q�i 
G��$b�DoA�*(�r�MϮXI��������B���;k�,�> VL)      �      x������ � �     