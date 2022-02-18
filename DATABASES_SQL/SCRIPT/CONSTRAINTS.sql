ALTER TABLE [dbo].[Angajati]  WITH CHECK ADD  CONSTRAINT [FK_Angajati_Angajati] FOREIGN KEY([SefDirect])
REFERENCES [dbo].[Angajati] ([Id_Angajat])


ALTER TABLE [dbo].[Angajati] CHECK CONSTRAINT [FK_Angajati_Angajati]


ALTER TABLE [dbo].[Angajati]  WITH CHECK ADD  CONSTRAINT [FK_Angajati_Judete] FOREIGN KEY([IdJudet])
REFERENCES [dbo].[Judete] ([IdJudet])


ALTER TABLE [dbo].[Angajati] CHECK CONSTRAINT [FK_Angajati_Judete]

ALTER TABLE [dbo].[Clienti]  WITH CHECK ADD  CONSTRAINT [FK_Clienti_Judete] FOREIGN KEY([IdJudet])
REFERENCES [dbo].[Judete] ([IdJudet])


ALTER TABLE [dbo].[Clienti] CHECK CONSTRAINT [FK_Clienti_Judete]

ALTER TABLE [dbo].[CoduriReducere]  WITH CHECK ADD  CONSTRAINT [FK_CoduriReducere_CoduriReducere] FOREIGN KEY([IdInfluencer])
REFERENCES [dbo].[Influenceri] ([IdInfluencer])


ALTER TABLE [dbo].[CoduriReducere] CHECK CONSTRAINT [FK_CoduriReducere_CoduriReducere]

ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [FK_Comenzi_Angajati] FOREIGN KEY([IdAngajatPrelucrare])
REFERENCES [dbo].[Angajati] ([Id_Angajat])


ALTER TABLE [dbo].[Comenzi] CHECK CONSTRAINT [FK_Comenzi_Angajati]


ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [FK_Comenzi_Clienti] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Clienti] ([IdClient])


ALTER TABLE [dbo].[Comenzi] CHECK CONSTRAINT [FK_Comenzi_Clienti]


ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [FK_Comenzi_CoduriReducere] FOREIGN KEY([IdCod])
REFERENCES [dbo].[CoduriReducere] ([IdCod])


ALTER TABLE [dbo].[Comenzi] CHECK CONSTRAINT [FK_Comenzi_CoduriReducere]


ALTER TABLE [dbo].[Comenzi]  WITH CHECK ADD  CONSTRAINT [FK_Comenzi_Curieri] FOREIGN KEY([IdCurier])
REFERENCES [dbo].[Curieri] ([IdCurier])

ALTER TABLE [dbo].[Curieri]  WITH CHECK ADD  CONSTRAINT [FK_Curieri_FirmeCurierat] FOREIGN KEY([IdFirmaCurierat])
REFERENCES [dbo].[FirmeCurierat] ([IdFirmaCurierat])


ALTER TABLE [dbo].[Curieri] CHECK CONSTRAINT [FK_Curieri_FirmeCurierat]


ALTER TABLE [dbo].[Curieri]  WITH CHECK ADD  CONSTRAINT [FK_Curieri_Judete] FOREIGN KEY([IdJudetLivrare])
REFERENCES [dbo].[Judete] ([IdJudet])


ALTER TABLE [dbo].[Curieri] CHECK CONSTRAINT [FK_Curieri_Judete]

ALTER TABLE [dbo].[Facturi]  WITH CHECK ADD  CONSTRAINT [FK_Facturi_Comenzi] FOREIGN KEY([IdComanda])
REFERENCES [dbo].[Comenzi] ([IdComanda])


ALTER TABLE [dbo].[Facturi] CHECK CONSTRAINT [FK_Facturi_Comenzi]


ALTER TABLE [dbo].[Facturi]  WITH CHECK ADD  CONSTRAINT [FK_Facturi_Produse] FOREIGN KEY([IdProdus])
REFERENCES [dbo].[Produse] ([Id_Produs])


ALTER TABLE [dbo].[Facturi] CHECK CONSTRAINT [FK_Facturi_Produse]

ALTER TABLE [dbo].[FirmeCurierat]  WITH CHECK ADD  CONSTRAINT [FK_FirmeCurierat_Judete] FOREIGN KEY([IdJudetSediu])
REFERENCES [dbo].[Judete] ([IdJudet])


ALTER TABLE [dbo].[FirmeCurierat] CHECK CONSTRAINT [FK_FirmeCurierat_Judete]

ALTER TABLE [dbo].[ImpoziteAngajati]  WITH CHECK ADD  CONSTRAINT [FK_ImpoziteAngajati_Angajati] FOREIGN KEY([IdAngajat])
REFERENCES [dbo].[Angajati] ([Id_Angajat])


ALTER TABLE [dbo].[ImpoziteAngajati] CHECK CONSTRAINT [FK_ImpoziteAngajati_Angajati]


ALTER TABLE [dbo].[ImpoziteAngajati]  WITH CHECK ADD  CONSTRAINT [FK_ImpoziteAngajati_Impozite] FOREIGN KEY([IdImpozit])
REFERENCES [dbo].[Impozite] ([IdImpozit])


ALTER TABLE [dbo].[ImpoziteAngajati] CHECK CONSTRAINT [FK_ImpoziteAngajati_Impozite]

ALTER TABLE [dbo].[Influenceri]  WITH CHECK ADD  CONSTRAINT [FK_Influenceri_Judete] FOREIGN KEY([IdJudet])
REFERENCES [dbo].[Judete] ([IdJudet])


ALTER TABLE [dbo].[Influenceri] CHECK CONSTRAINT [FK_Influenceri_Judete]

ALTER TABLE [dbo].[JudeteRegiuni]  WITH CHECK ADD  CONSTRAINT [FK_JudeteRegiuni_Judete] FOREIGN KEY([IdJudet])
REFERENCES [dbo].[Judete] ([IdJudet])


ALTER TABLE [dbo].[JudeteRegiuni] CHECK CONSTRAINT [FK_JudeteRegiuni_Judete]


ALTER TABLE [dbo].[JudeteRegiuni]  WITH CHECK ADD  CONSTRAINT [FK_JudeteRegiuni_Regiuni] FOREIGN KEY([IdRegiune])
REFERENCES [dbo].[Regiuni] ([IdRegiune])


ALTER TABLE [dbo].[JudeteRegiuni] CHECK CONSTRAINT [FK_JudeteRegiuni_Regiuni]

ALTER TABLE [dbo].[Produse]  WITH CHECK ADD  CONSTRAINT [FK_Produse_Branduri] FOREIGN KEY([IdBrand])
REFERENCES [dbo].[Branduri] ([IdBrand])


ALTER TABLE [dbo].[Produse] CHECK CONSTRAINT [FK_Produse_Branduri]


ALTER TABLE [dbo].[Produse]  WITH CHECK ADD  CONSTRAINT [FK_Produse_CategoriiProduse] FOREIGN KEY([IdCategorie])
REFERENCES [dbo].[CategoriiProduse] ([IdCategorie])


ALTER TABLE [dbo].[Produse] CHECK CONSTRAINT [FK_Produse_CategoriiProduse]